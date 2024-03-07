<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Contact;
use Validator;
use Auth;
use App\User;
use App\Invoice;
use App\Quotation;
use App\Transaction;
use App\Attendance;
use App\InstituteClass;
use App\LeaveStatus;
use App\Holiday;
use App\Company;
use App\Models\Subject;
use App\Models\SubjectWiseAttendance;
use App\Notice;
use App\CompanySmsTemplate;
use Hash;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Mail;
use App\Notifications\ContactAccount as ContactAccountNotification;
use App\Mail\GeneralMail;
use App\Utilities\Overrider;
use App\Imports\ContactsImport;
use Maatwebsite\Excel\Facades\Excel;
use DataTables;
use Response;
use DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth as FacadesAuth;
use URL;

class ContactController extends Controller
{
	/**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
    	date_default_timezone_set(get_company_option('timezone',get_option('timezone','Asia/Dhaka')));

        $this->middleware(function ($request, $next) {
        	// dd($request->all());
            if( has_membership_system() == 'enabled' ){
                if( ! has_feature( 'contacts_limit' ) ){
                    return redirect('membership/extend')->with('message',_lang('Your Current package not support this feature. You can upgrade your package !'));
                }

                //If request is create/store
                $route_name = \Request::route()->getName();


				if( $route_name == 'contacts.store'){

					if( ! has_feature_limit( 'contacts_limit' ) ){
					   if( ! $request->ajax()){
						   return redirect('membership/extend')->with('message', _lang('Your have already reached your usages limit. You can upgrade your package !'));
					   }else{
						   return response()->json(['result'=>'error','message'=> _lang('Your have already reached your usages limit. You can upgrade your package !') ]);
					   }
					}
				 }
            }

            return $next($request);
        });
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('backend.accounting.contacts.contact.list');
	}


	public function get_table_data(){

		$currency = currency();

		$contacts = Contact::with("group")->with("class")
		                                  ->select('contacts.*')
										  ->where("contacts.company_id",company_id())
										  ->orderBy("contacts.id","desc");

		return Datatables::eloquent($contacts)

						->editColumn('contact_image', function ($contact) {
							return '<img class="thumb-sm rounded-btn-xs mr-2" src="'.asset('public/uploads/contacts/'.$contact->contact_image) .'">';
						})

						->editColumn('contact_name', function ($contact) {
							return '<a href="'.action('ContactController@show', $contact['id']).'">'.$contact->contact_name.'</a';
						})

						->addColumn('action', function ($contact) {
								return '<form action="'.action('ContactController@destroy', $contact['id']).'" class="text-center" method="post">'
								.'<a href="'.action('ContactController@show', $contact['id']).'" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="Watch details"><i class="ti-eye"></i></a>&nbsp;'
								.'<a href="'.action('ContactController@edit', $contact['id']).'" class="btn btn-warning btn-xs" data-toggle="tooltip" data-placement="top" title="Edit"><i class="ti-pencil"></i></a>&nbsp;'
								.'<a href="'.action('ContactController@leave', $contact['id']).'" class="btn btn-info btn-xs ajax-modal" data-title="Leave Info" data-toggle="tooltip" data-placement="top" title="Insert leave"><i class="ti-unlink"></i></a>&nbsp;'
								.csrf_field()
								.'<input name="_method" type="hidden" value="DELETE">'
								.'<button class="btn btn-danger btn-xs btn-remove" type="submit" data-toggle="tooltip" data-placement="top" title="Delete"><i class="ti-eraser"></i></button>&nbsp;'

								.'</form>';
						})
						->setRowId(function ($contact) {
							return "row_".$contact->id;
						})
						->rawColumns(['action', 'contact_image', 'contact_name'])
						->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $data['classes']=InstituteClass::leftjoin('contact_groups','institute_classes.group_id','=','contact_groups.id')
        ->select('institute_classes.id','institute_classes.class_name','contact_groups.name')
        ->where('institute_classes.company_id',company_id())
        ->get();
		if( ! $request->ajax()){
		   return view('backend.accounting.contacts.contact.create',$data);
		}else{
           return view('backend.accounting.contacts.contact.modal.create',$data);
		}
    }


    public function import(Request $request)
    {
        if($request->isMethod('get')){
			return view('backend.accounting.contacts.contact.import');
        }else{
        	@ini_set('max_execution_time', 0);
	        @set_time_limit(0);

	        $validator = Validator::make($request->all(), [
				'file' => 'required|mimes:xlsx',
			]);

			if ($validator->fails()) {
				if($request->ajax()){
				    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
				}else{
					return redirect('contacts/import')->withErrors($validator)
													  ->withInput();
				}
	        }

	        //Import Contacts
	        //$file_type = $request->file('file')->getClientOriginalExtension();
            $new_rows = 0;

	        DB::beginTransaction();

	        $previous_rows = Contact::where('company_id',company_id())->count();

			$data = array();
            $data['group_id'] = $request->group_id;
	        $import = Excel::import(new ContactsImport($data), request()->file('file'));

	        $current_rows = Contact::where('company_id',company_id())->count();

            $new_rows = $current_rows - $previous_rows;

	        DB::commit();

        	return back()->with('success',$new_rows.' '._lang('Rows Imported Sucessfully'));
        }

	}

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
		$validator = Validator::make($request->all(), [
			'class_id'  => 'required',
			'contact_name'  => 'required|max:50',
			'contact_email' => [
                'nullable',
                'email',
                // Rule::unique('contacts')->where('company_id',company_id()),
            ],
			'reg_no'        =>['required',  Rule::unique('contacts')->where('company_id',company_id())],
			'contact_phone' => 'required|max:20',
			'country'       => 'nullable|max:50',
			// 'group_id' 		=> 'required',

		]
		// [
		//     'group_id.required' => 'The group field is required.'
		// ]
	    );

		if ($validator->fails()) {
			if($request->ajax()){
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return redirect('students/create')
							->withErrors($validator)
							->withInput();
			}
		}

		$contact_image ="avatar.png";
	    if($request->hasfile('contact_image'))
		{
			 $file = $request->file('contact_image');
			 $contact_image = "contact_image".time().'.'.$file->getClientOriginalExtension();
			 $file->move(public_path()."/uploads/contacts/", $contact_image);
		}


		DB::beginTransaction();

		//Check client has already an account
		// $other = User::where('mobile',$request->contact_phone)
		//              ->where('user_type','!=','client')->first();

        // if( $other ){
        // 	if($request->ajax()){
		// 	    return response()->json(['result'=>'error','message'=>'Sorry, This phone number already registered with an company admin or staff !']);
		// 	}else{
		// 		return redirect('contacts/create')->with('error', _lang('Sorry, This phone number already registered with an company admin or staff !'))->withInput();
		// 	}
        // }

		$client = User::where('mobile',$request->contact_phone)
		              ->where('user_type','client')->first();

        // dd($request->all());
        $contact = new Contact();

		$contact->contact_name = $request->input('contact_name');
		$contact->contact_email = $request->input('contact_email');
		$contact->reg_no = $request->input('reg_no');
		$contact->roll_no = $request->input('roll_no');
		$contact->contact_phone = $request->input('contact_phone');
		$contact->address = $request->input('address');
        $contact->blood_group=$request->blood_group;
		if($client){
			$contact->user_id = $client->id;
		}
		$contact->class_id = $request->input('class_id');

		$contact->group_id = $request->input('group_id');
		$contact->company_id = company_id();
		$contact->contact_image = $contact_image;

        $contact->save();

		//Update Package limit
		update_package_limit('contacts_limit');

		DB::commit();


		if(! $request->ajax()){
           return redirect('students/create')->with('success', _lang('New student added sucessfully'));
        }else{
		   return response()->json(['result'=>'success','action'=>'store','message'=>_lang('New student added sucessfully'),'data'=>$contact]);
		}

   }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request,$id)
    {
    	$company_id = company_id();
    	$data = array();

        $data['contact'] = Contact::where("id",$id)
						  		  ->where("company_id", $company_id)->first();

		$data['invoices'] = Invoice::where('client_id',$id)
								   ->where("company_id", $company_id)
								   ->get();

		$data['quotations'] = Quotation::where('related_id',$id)
				                       ->where('related_to','contacts')
									   ->where("company_id", $company_id)->get();

		$data['transactions'] = Transaction::where('payer_payee_id',$id)
							       		   ->where("company_id", $company_id)->get();


		//Summary Data
		$year = date('Y');
		$month = date('m');
		$selctMonthStartDate = Carbon::parse($year.'-'.$month.'-01 00:00:00')->toDateTimeString();
		$days = Carbon::parse($selctMonthStartDate)->daysInMonth;
		$selctMonthEndDate = Carbon::parse($year.'-'.$month.'-'.$days.' 23:59:59')->toDateTimeString();
		$data['total_present'] = DB::table('contacts')->where('contacts.id',$id)
		                                              ->leftjoin('attendances as a','a.student_id','=','contacts.reg_no')
													  ->whereBetween('a.created_at', [$selctMonthStartDate, $selctMonthEndDate])
													  ->where('a.company_id',company_id())
		                                              ->count();

		$data['total_leave'] = DB::table('leave_statuses')
									->where('contact_id', $id)
									->where('company_id',company_id())
		                            ->count();

		$data['invoice_due_amount'] = DB::table('invoices')
									    ->selectRaw('sum(grand_total) as grand_total, sum(paid) as paid')
										->whereRaw("(Status = 'Unpaid' or Status = 'Partially_Paid')")
										->where('client_id', $id)
										->first();

		if(! $request->ajax()){
		    return view('backend.accounting.contacts.contact.view', $data);
		}else{
			return view('backend.accounting.contacts.contact.modal.view', $data);
		}

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request,$id)
    {
		$contact = Contact::where("id",$id)
		                  ->where("company_id",company_id())->first();
        $data['classes']=InstituteClass::leftjoin('contact_groups','institute_classes.group_id','=','contact_groups.id')
        ->select('institute_classes.id','institute_classes.class_name','contact_groups.name')
        ->where('institute_classes.company_id',company_id())
        ->get();
		if(! $request->ajax()){
		   return view('backend.accounting.contacts.contact.edit',compact('contact','id'),$data);
		}else{
           return view('backend.accounting.contacts.contact.modal.edit',compact('contact','id'),$data);
		}

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
    	DB::beginTransaction();

		$contact = Contact::where("id",$id)->where("company_id",company_id())->first();

		// dd($contact['reg_no']);

		$validator = Validator::make($request->all(), [
			'class_id'  => 'required',
			'contact_name'  => 'required|max:50',
			'contact_email' => [
                'nullable',
                'email',
                // Rule::unique('contacts')->where('company_id',company_id()),
            ],
			'reg_no'        =>'required', //Rule::unique('contacts')->where('company_id',company_id())
			'contact_phone' => 'required|max:20',
			'country'       => 'nullable|max:50',
			// 'group_id' 		=> 'required',

		]
		// [
		//     'group_id.required' => 'The group field is required.'
		// ]
	    );

		if ($validator->fails()) {
			if($request->ajax()){
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return redirect()->back()
							->withErrors($validator)
							->withInput();
			}
		}

		if($request->hasfile('contact_image'))
		{
			$file = $request->file('contact_image');
			$contact_image = "contact_image".time().'.'.$file->getClientOriginalExtension();
			$file->move(public_path()."/uploads/contacts/", $contact_image);
		}

		if($request->reg_no){
			DB::table('attendances')->where("student_id",$contact['reg_no'])
			                      ->where("company_id",company_id())
								  ->update(['student_id'=>$request->reg_no]);

		}

		//Check client has already an account
		// $other = Contact::where('reg_no',$request->reg_no)
        //          ->where("company_id",company_id())->first();

        // if( $other ){
        // 	if($request->ajax()){
		// 	    return response()->json(['result'=>'error','message'=>'Sorry, This ID/Reg No. already taken !']);
		// 	}else{
		// 		return back()->with('error', _lang('Sorry, This ID/Reg No. already taken !'))->withInput();
		// 	}
        // }

		$client = User::where('mobile',$request->contact_phone)
		              ->where('user_type','client')->first();

		// $contact->profile_type = $request->input('profile_type');
		// $contact->company_name = $request->input('company_name');
		$contact->contact_name = $request->input('contact_name');
		$contact->contact_email = $request->input('contact_email');
		$contact->contact_phone = $request->input('contact_phone');
		// $contact->vat_id = $request->input('vat_id');
		$contact->reg_no = $request->input('reg_no');
		$contact->roll_no = $request->input('roll_no');
		$contact->class_id = $request->input('class_id');
        $contact->blood_group=$request->blood_group;
		// $contact->country = $request->input('country');
		// $contact->currency = 'BDT';
		// $contact->city = $request->input('city');
		// $contact->state = $request->input('state');
		// $contact->zip = $request->input('zip');
		$contact->address = $request->input('address');
		// $contact->facebook = $request->input('facebook');
		// $contact->twitter = $request->input('twitter');
		// $contact->linkedin = $request->input('linkedin');
		$contact->remarks = $request->input('remarks');
		$contact->group_id = $request->input('group_id');
		if($client){
			$contact->user_id = $client->id;
		}
		$contact->company_id = company_id();
		if($request->hasfile('contact_image')){
			$contact->contact_image = $contact_image;
		}

        $contact->save();

		// $student = Attendance::where("student_id",$request->reg_no)->where("company_id",company_id())->first();

        DB::commit();

		if(! $request->ajax()){
           return redirect('students')->with('success', _lang('Student information updated sucessfully'));
        }else{
		   return response()->json(['result'=>'success','action'=>'update', 'message'=>_lang('Student information updated sucessfully'),'data'=>$contact]);
		}

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
		DB::beginTransaction();

        $contact = Contact::where("id",$id)
		                  ->where("company_id",company_id())
						  ->first();

		$attendance = Attendance::where('student_id',$contact->reg_no);
        // dd($attendance);
		if($attendance){
			$attendance->delete();
		}

        $contact->delete();

		DB::commit();


        return redirect('students')->with('success',_lang('Information has been deleted sucessfully'));
    }


	public function get_client_info( $id = '' ){
		$contact = Contact::where("id",$id)
						  ->where("company_id",company_id())->first();
		echo json_encode($contact);

	}


	public function send_email(Request $request, $id)
    {
		@ini_set('max_execution_time', 0);
	    @set_time_limit(0);
	    Overrider::load("Settings");

		$validator = Validator::make($request->all(), [
			'email_subject' => 'required',
			'email_message' => 'required',
		]);

		if ($validator->fails()) {
			if($request->ajax()){
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return back()->withErrors($validator)
							 ->withInput();
			}
		}

        $contact = Contact::where("id",$id)
		                  ->where("company_id",company_id())->first();

		//Send email
		$subject = $request->input("email_subject");
		$message = $request->input("email_message");

		$mail  = new \stdClass();
		$mail->subject = $subject;
		$mail->body = $message;

		try{
			Mail::to($contact->contact_email)->send(new GeneralMail($mail));
		}catch (\Exception $e) {
			if(! $request->ajax()){
			   return back()->with('error', _lang('Sorry, Error Occured !'));
			}else{
			   return response()->json(['result'=>'error','message'=>_lang('Sorry, Error Occured !')]);
			}
		}

        if(! $request->ajax()){
           return back()->with('success', _lang('Email Send Sucessfully'));
        }else{
		   return response()->json(['result'=>'success', 'action'=>'update', 'message'=>_lang('Email Send Sucessfully'),'data'=>$contact]);
		}
    }

	public function student_attendance()
    {
        $data=array();
		$data['notices']=Notice::where("status",1)->where("company_id",company_id())->get();
        return view('backend.accounting.contacts.contact.attendance1',$data);
	}

	public function listAttendance(Request $request)
    {
		$dt = Carbon::now();
        $today= $dt->toDateString();
		// dd($today);
        $columns = array(0 =>'sl',1 =>'student_id',2=> 'class_name',3=>'contact_name',4 =>'entry_at',5=>'exit_at');
        $totalData = Attendance::where("attendances.company_id",company_id())->whereDate('attendances.created_at', Carbon::today())->count();
        $limit = $request->input('length');$start = $request->input('start');
        $order = $columns[$request->input('order.0.column')]; $dir = $request->input('order.0.dir');
        if(empty($request->input('search.value')))
        {
            $posts = Attendance::leftjoin('institute_classes as ic','ic.id','=','attendances.class_id')
			        ->leftjoin('contacts as c','c.reg_no','=','attendances.student_id')
					->select('attendances.*','ic.class_name','c.contact_name','c.contact_image')
					->where("c.company_id",company_id())
					->whereDate('attendances.created_at', Carbon::today())
					->offset($start)->limit($limit)
					->orderBy("attendances.id","desc")->take(5)->get();
            $totalFiltered =  Attendance::where("attendances.company_id",company_id())
			                  ->whereDate('attendances.created_at', Carbon::today())
			                  ->count();
        }
        else{
            $search = $request->input('search.value');
            $posts = Attendance::leftjoin('institute_classes as ic','ic.id','=','attendances.class_id')
								->leftjoin('contacts as c','c.reg_no','=','attendances.student_id')
					            ->select('attendances.*','ic.class_name','c.contact_name','c.contact_image')

								->where("c.company_id",company_id())
                                ->orwhere('c.contact_name', 'like', "%{$search}%")
                   				 ->orwhere('student_id', '=', $search)
                                 ->offset($start)->limit($limit)
                                 ->orderBy("attendances.id","asc")->get();
            $totalFiltered = Attendance::leftjoin('institute_classes as ic','ic.id','=','attendances.class_id')
			                 ->leftjoin('contacts as c','c.reg_no','=','attendances.student_id')
					          ->select('attendances.*','ic.class_name','c.contact_name')
			                 ->where("c.company_id",company_id())
			                 ->orwhere('c.contact_name', 'like', "%{$search}%")
				             ->orwhere('student_id', '=', $search)
                            ->count();
        }
        $data = array();

    if($posts){
		// dd($posts);
        foreach($posts as $key=>$r)
        {
            $nestedData['sl'] = ++$key;
            $nestedData['student_id'] = $r->student_id;
            $nestedData['contact_image'] ='<img class="thumb-sm rounded-btn-xs mr-2" src="'.asset('public/uploads/contacts/'.$r->contact_image).'" alt=" placeholder image" >';
            $nestedData['class_name'] = $r->class_name;
            $nestedData['contact_name'] = $r->contact_name;


            if( $r->entry_at && is_null($r->exit_at)){
                $nestedData['entry_at'] = date('g:i A', strtotime($r->entry_at));
                $nestedData['exit_at'] ='<button type="button" class="btn btn-success" disabled>In School</button>';
            }else if($r->exit_at){
                $nestedData['entry_at'] = date('g:i A', strtotime($r->entry_at));
                $nestedData['exit_at'] = date('g:i A', strtotime($r->exit_at));
                // $nestedData['type'] =  '<button type="button" class="btn btn-danger" disabled>Exit</button>';
            }
            $data[] = $nestedData;
        }
    }
        $json_data = array(
            "draw"        => intval($request->input('draw')),
            "recordsTotal"    => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data"        => $data
        );
        echo json_encode($json_data);


    }

    //     public function create(Request $request)
    // {
	// 	if( ! $request->ajax()){
	// 	   return view('backend.driver.create');
	// 	}else{
    //        return view('backend.driver.create');
	// 	}
    // }

       public function saveAttendance(Request $request)
    {
        // dd($request->all());
		$url= URL::to('/');
        $day=Carbon::today()->dayName;
		// dd($day);
        $company = Company::find(company_id());
		$student=Contact::where('reg_no',$request->stu_id)->where('company_id',company_id())->first();
		$holiday=Holiday::whereDate('holidays.start_date', Carbon::today())->where('company_id',company_id())->exists();
        // dd($holiday);
		$default_holiday=get_company_option('default_holidays');
		$myArray = explode(',', $default_holiday);

		if($student){

			if ($holiday!='true' && !in_array($day,$myArray)) {

				$class=InstituteClass::where('id',$student->class_id)->where('company_id',company_id())->first();

				$user = Attendance::whereDate('attendances.created_at', Carbon::today())->where('student_id',$request->stu_id)->where('company_id',company_id())->first();
				// dd($user);
				if(isset($user->exit_at)){
				return response()->json(['result'=>'warning','action'=>'update','imageUrl'=>" $url/public/uploads/contacts/$student->contact_image", 'message'=>"Sorry! $student->contact_name  your today's attendance completed.",'data'=>$student]);

				}elseif(!isset($user->entry_at)){
					$max_entry_time="+".get_company_option('max_entry_time')." minutes";
					$class_start = date('H:i:s', strtotime($class->start_time. $max_entry_time));
					// dd($class_start);
					if( $class_start < $request->entry_time){

						return response()->json(['result'=>'warning','action'=>'update','imageUrl'=>" $url/public/uploads/contacts/$student->contact_image", 'message'=>"Sorry! $student->contact_name  is late",'data'=>$student]);
					}else{
						$attendance = new Attendance;
						$attendance->student_id = $student->reg_no;
						$attendance->class_id = $student->class_id;
                        $attendance->company_id = company_id();
						$attendance->entry_at=$request->entry_time;
						// dd($attendance);
						$attendance->save();
						// dd($student);
						if (has_feature('sms_panel')) {
							$user = Contact::where('company_id',$company->id)
							->where('reg_no',$student->reg_no)
							->first();
							$enter=Carbon::now();
							$replace = array(
								'{student_name}'=>$user->contact_name,
								'{id_no}'=>$student->reg_no,
								'{enter_time}'=>date("d-m-Y g:i A", strtotime($enter)),
								'{company_short_name}' =>get_company_option('institute_short_name'),
							);

							//Send email Confrimation
							Overrider::load("Settings");
							$template = CompanySmsTemplate::where('name','Enter')->first();
							$template->body = process_string($replace,$template->body);
							 // sms_subscription($user,$template->body);
							// dd($user);
							sms_send_guardian($user,$template->body);
						}

						$notification = array(
							'message' => "$student->contact_name attendance Taken.",
							'result' => 'success',
							'imageUrl'=>"$url/public/uploads/contacts/$student->contact_image"
						);
					}


				}else{
					$duration_time="+".get_company_option('duration_time')." minutes";
					// dd((int)$duration_time);
					$entryDuration = date('H:i:s', strtotime($user->entry_at. $duration_time));
					// dd($entryDuration);
					if($request->entry_time < $entryDuration){
					return response()->json(['result'=>'warning','action'=>'update','imageUrl'=>" $url/public/uploads/contacts/$student->contact_image", 'message'=>"Sorry! $student->contact_name, please wait for while.",'data'=>$student, 'table' => '#postTbl']);

					}else{
						$attendance = Attendance::find($user->id);

						$attendance->exit_at=$request->entry_time;
						//dd($attendance);
						$attendance->update();
						if (has_feature('sms_panel')) {
							$user = Contact::where('company_id',$company->id)
							->where('reg_no',$student->reg_no)
							->first();
							$exit=Carbon::now();
							$replace = array(
								'{student_name}'=>$user->contact_name,
								'{id_no}'=>$student->reg_no,
								'{exit_time}'=>date("d-m-Y g:i A", strtotime($exit)),
								'{company_short_name}' =>get_company_option('institute_short_name'),
							);
							//Send email Confrimation
							Overrider::load("Settings");
							$template = CompanySmsTemplate::where('name','Exit')->first();
							$template->body = process_string($replace,$template->body);
							sms_send_guardian_exit($user,$template->body);
						}

						$notification = array(
							'message' => "$student->contact_name exited.",
							'result' => 'success',
							'imageUrl'=>"$url/public/uploads/contacts/$student->contact_image"
						);
					}


				}

				// dd($notification)

				return Response::json($notification);

			}else{
				return response()->json(['result'=>'warning','action'=>'update', 'message'=>_lang('Sorry! today is holiday'),'data'=>$student]);
			}

			// }
		}else{
		  return response()->json(['result'=>'warning','action'=>'update', 'message'=>_lang('Sorry! This ID is not valid.'),'data'=>$student]);

		}

    }

	public function showList()
    {
    	$company_id = company_id();
    	$data = array();
		$data['students'] = Attendance::leftjoin('institute_classes as ic','ic.id','=','attendances.class_id')
		->leftjoin('contacts as c','c.reg_no','=','attendances.student_id')
		->select('attendances.*','ic.class_name','c.contact_name')
		->where("c.company_id",company_id())
		->whereDate('attendances.created_at', Carbon::today())
		->orderBy("attendances.id","asc")->get();

		return view('backend.accounting.contacts.contact.modal.view', $data);
    }

	public function destroyAttendance($id)
    {
		DB::beginTransaction();

        $contact = Attendance::where("id",$id)
		                  ->where("company_id",company_id())
						  ->first();

		/*$user = User::find($contact->user_id);
		if($user){
			$user->delete();
		}*/

        $contact->delete();

		DB::commit();


        return redirect('attendance/show-student')->with('success',_lang('Information has been deleted sucessfully'));
    }

	public function leave(Request $request,$id)
    {
		$contact = Contact::leftjoin('leave_statuses as ls','ls.contact_id','=','contacts.id')
		                  ->select('contacts.id','ls.start_date','ls.end_date','ls.reason','ls.reference')
		                  ->whereDate('ls.end_date','>', Carbon::today())
		                  ->where("contacts.id",$id)
		                  ->where("ls.company_id",company_id())->first();
		// dd($contact);
		if(! $request->ajax()){
		//    return view('backend.accounting.contacts.contact.edit',compact('contact','id'));
		}else{
           return view('backend.accounting.contacts.contact.modal.leave',compact('contact','id'));
		}

    }

	public function updateLeave(Request $request, $id)
    {
		// dd($request->all());
    	DB::beginTransaction();

		$contact = Contact::where("id",$id)->where("company_id",company_id())->first();

		$validator = Validator::make($request->all(), [
			'reason'  => 'required',
		]

	    );

		if ($validator->fails()) {
			if($request->ajax()){
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return redirect()->route('contact.leave', $id)
							->withErrors($validator)
							->withInput();
			}
		}


		//Check client has already an account
		// $other = User::where('email',$request->contact_email)
		//              ->where('user_type','!=','client')->first();

        // if( $other ){
        // 	if($request->ajax()){
		// 	    return response()->json(['result'=>'error','message'=>'Sorry, This email already registered with an company or staff !']);
		// 	}else{
		// 		return back()->with('error', _lang('Sorry, This email already registered with an company or staff !'))->withInput();
		// 	}
        // }

        $startDate = new Carbon($request->start_date);
        $endDate = new Carbon($request->end_date);
        $all_dates = array();
        while ($startDate->lte($endDate)){
          $all_dates[] = $startDate->toDateString();

          $startDate->addDay();
        }

        if(isset($request->start_date)){
         foreach($all_dates as $holdate){
		$contact = new LeaveStatus();
		// $contact->profile_type = $request->input('profile_type');
		$contact->company_id = company_id();
		$contact->reference = $request->input('reference');
		$contact->reason = $request->input('reason');
		$contact->contact_id = $request->input('contact_id');
		$contact->start_date = $holdate;
		$contact->end_date = $request->input('end_date');


        $contact->save();
         }
        }
        DB::commit();


		return response()->json(['result'=>'success','action'=>'update', 'message'=>_lang('Leave information updated sucessfully'),'data'=>$contact]);


    }

	public function showLeaveList()
    {
    	$company_id = company_id();
    	$data = array();
		$data['students'] = LeaveStatus::leftjoin('contacts as c','c.id','=','leave_statuses.contact_id')
		->select('leave_statuses.reference','leave_statuses.start_date','leave_statuses.end_date','leave_statuses.reason',
		  'c.contact_name')
		->where("leave_statuses.company_id",company_id())
		->get();

		return view('backend.accounting.contacts.contact.leave_list', $data);
    }
    public function student_attendance_subject(){

          $company_id = company_id();
          $data= array();
          $data['class_lists']=Subject::leftjoin('institute_classes','subjects.class_id','=','institute_classes.id')
                                      ->select('subjects.class_id','subjects.name','institute_classes.class_name','subjects.id')
                                      ->where('subjects.company_id',$company_id)
                                      ->where('subjects.teacher',Auth::user()->id)
                                      ->get();
        //   dd(Auth::user());
          $data['other_class_lists']=Subject::leftjoin('institute_classes','subjects.class_id','=','institute_classes.id')
                                    ->select('subjects.class_id','subjects.name','institute_classes.class_name','subjects.id')
                                    ->where('subjects.company_id',$company_id)
                                    ->whereNotIn('subjects.teacher',[Auth::user()->id])
                                    ->get();

        // dd($data['other_class_lists']);
        return view('backend.accounting.contacts.contact.attendance',$data);
    }

    public function subject_wise_attendance(Request $request, $subject_id){
        // dd($subject_id);
        $company_id = company_id();


        if($request->isMethod('get')){
            $data = array();
            $data['subject_id']=$subject_id;
            $data['students'] = Subject::leftjoin('contacts','contacts.class_id','=','subjects.class_id')
                                ->where('subjects.id',$subject_id)
                                ->where('contacts.company_id',$company_id)
                                ->get();
            $data['other'] = SubjectWiseAttendance::where('subject_id',$subject_id)
                                ->whereDate('created_at',Carbon::today())
                                ->where('company_id',$company_id)->pluck('student_id')->toarray();
            $data['leave_list']=LeaveStatus::whereDate('start_date',Carbon::today())
                                ->where('company_id',$company_id)->pluck('contact_id')->toarray();

            // dd($data['leave_list'],$data['students']);

            return view('backend.accounting.contacts.contact.subject_attendance', $data);
        }else{
            // dd($request->all());
            DB::beginTransaction();

            //Check if lead ID is valid
            // $lead = Lead::where('id',$request->lead_id)
            //             ->where('company_id',company_id())
            //             ->first();

            // if( ! $lead ){
            //     if($request->ajax()){
            //         return response()->json(['result'=>'error','message'=>'Invalid Lead !']);
            //     }else{
            //         return back()->with('error', _lang('Invalid Lead !'))->withInput();
            //     }
            // }

            //Check client has already an account
            $other = SubjectWiseAttendance::where('subject_id',$request->subject_id)
                         ->whereDate('created_at',Carbon::today())
                         ->where('company_id',$company_id)->pluck('student_id')->toarray();

            if( $other ){
                if($request->ajax()){
                    return response()->json(['result'=>'error','message'=>'Sorry, This email already registered with an company admin or staff !']);
                }else{
                    return back()->with('error', _lang('Sorry, This attendance has already taken!'))->withInput();
                }
            }

            // $client = User::where('email',$request->contact_email)
            //               ->where('user_type','client')->first();
            $today = date('Y-m-d');

            foreach($request->presents as $present){
                $attendance = new SubjectWiseAttendance();
                $attendance->class_id = $request->class_id;
                $attendance->student_id = $present;
                $attendance->subject_id = $subject_id;
                $attendance->present_time = $request->present_time;
                $attendance->company_id = $company_id;
                // dd($attendance);
                $attendance->save();
            }


            if(get_company_option('instant_absent_sms')=='yes'){
                $data['taken'] = SubjectWiseAttendance::where('subject_id',$subject_id)
                                ->whereDate('created_at',Carbon::today())
                                ->where('company_id',$company_id)->pluck('student_id')->toarray();
                $data['leave_list']=LeaveStatus::whereDate('start_date',Carbon::today())
                                ->where('company_id',$company_id)->pluck('contact_id')->toarray();

                $data['report_data']=Contact::leftjoin('subject_wise_attendances','subject_wise_attendances.student_id','=','contacts.id')
                                            ->select('contacts.contact_name','contacts.contact_phone','contacts.class_id','contacts.reg_no')
                                            ->wherenotin('contacts.id', $data['taken'])
                                            ->wherenotin('contacts.id', $data['leave_list'])
                                            ->where('contacts.class_id',$attendance->class_id )
                                            ->get();
                // dd($data['report_data']);
                if(count($data['report_data'])>0){
                    $data['report_data'];
                    sms_send_subject_student($data['report_data'],$subject_id);
                }


            }

            DB::commit();





            return redirect('/subject-attendance')->with('success', _lang('Attendance Taken sucessfully'));

        }

    }

	public function get_pass()
    {
    	$company_id = company_id();
    	$data = array();
		return view('backend.accounting.contacts.contact.pass', $data);
    }
	public function pass_post(Request $request)
    {
    	// dd($request->all());
		if(null!==(get_company_option('access_code'))){
			// dd(get_company_option('access_code'));
			if($request->password_confirmation==get_company_option('access_code')){
				// dd(get_company_option('access_code'));
				return redirect('attendance/show_student');
			}else{
				return redirect()->back()->with('error', 'Wrong Code! Please try again.');
			}
		}else{
			return redirect('/company/general_settings');
		}
    }

}
