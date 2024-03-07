<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use Illuminate\Support\Arr;
use App\Driver;
use App\Company;
use App\Invoice;
use Validator;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Facades\Excel;
use DB;
use Auth;
use App\Transaction;
use Hash;
use Response;

class DriverController extends Controller
{
    public function __construct()
    {
        date_default_timezone_set(get_company_option('timezone',get_option('timezone','Asia/Dhaka')));
        
        $this->middleware(function ($request, $next) {
            if( has_membership_system() == 'enabled' ){
                if( ! has_feature( 'drivers_limit' ) ){
                    return redirect('membership/extend')->with('message',_lang('Your Current package not support this feature. You can upgrade your package !'));
                }

                //If request is create/store
                // $route_name = \Request::route()->getName();
                // if( $route_name == 'driver.create'){
                //       if( ! $request->ajax()){
                //           return redirect('membership/extend')->with('message', _lang('Your have already reached your usages limit. You can upgrade your package !'));
                //       }else{
                //           return response()->json(['result'=>'error','message'=> _lang('Your have already reached your usages limit. You can upgrade your package !') ]);
                //       }
                //    }
            }

            return $next($request);
        });
    }

    public function showDrivers()
    {
    	// dd(session('company_id'));
    	 $data = array();
        // return view('pages.about',$data);
        // $items = Item::where("company_id",company_id())
        //              ->where("item_type","product")
        //              ->orderBy("id","desc")->get();
        // $data['users'] =Auth::user()->company;
        // dd(Auth::user()->company->drivers_limit);
        return view('backend.driver.driver_list',$data);
    }

     public function listDriver(Request $request)
    {
        $columns = array(0 =>'profile_picture',1 =>'name',2=> 'mobile',3=>'address',4 =>'license_no',5=> 'license_issue_date',6=>'status',7=> 'action');
        $totalData = Driver::where("drivers.company_id",company_id())->count();
        $limit = $request->input('length');$start = $request->input('start');
        $order = $columns[$request->input('order.0.column')]; $dir = $request->input('order.0.dir');
        if(empty($request->input('search.value')))
        {
            $posts = Driver::where("drivers.company_id",company_id())->offset($start)->limit($limit)->orderBy("drivers.id","desc")->get();
            $totalFiltered =  Driver::where("drivers.company_id",company_id())->count();
        }
        else{
            $search = $request->input('search.value');
            $posts = Driver::where("drivers.company_id",company_id())
                    ->orwhere('name', 'like', "%{$search}%")
                    ->orwhere('mobile', 'like', "%{$search}%")
                    ->orwhere('license_no', 'like', "%{$search}%")
                   
                    ->offset($start)->limit($limit)
                    ->orderBy("drivers.id","desc")->get();
            $totalFiltered = Driver::where("drivers.company_id",company_id())
                    ->orwhere('name', 'like', "%{$search}%")
                    ->orwhere('mobile', 'like', "%{$search}%")
                    ->orwhere('license_no', 'like', "%{$search}%")
                    ->count();
        }
        $data = array();

    if($posts){
        foreach($posts as $r)
        {     
            $nestedData['profile_picture'] = '<img class="thumb-sm rounded-btn-xs mr-2" src="'.asset('public/uploads/driver/'.$r->profile_picture).'" alt=" placeholder image" >';
            $nestedData['name'] = $r->name;
            $nestedData['mobile'] = $r->mobile;
            $nestedData['address'] = $r->address;
            $nestedData['license_no'] = $r->license_no;
            $nestedData['license_issue_date'] = date('D, d M, Y', strtotime($r->license_issue_date));
           if( $r->status==0){
                $status = '<div class="btn-group"><div class="badge badge-warning dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true" style="color:#f1f5fa"><span>Inactive</span></a>
                <div class="dropdown-menu" x-placement="top-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(4px, -165px, 0px);">
                    <a class="dropdown-item csts" data-id="'.$r->id.'" data-sts="1" href="#" style="">Active</a></div>
                </div>
                 </div>';
            }else{
                $status = '<div class="btn-group"><div class="badge badge-success dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true" style="color:#f1f5fa"><span>Active</span></a>
                <div class="dropdown-menu" x-placement="top-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(4px, -165px, 0px);">
                    <a class="dropdown-item csts" style="" data-id="'.$r->id.'" data-sts="0" href="#">Inactive</a></div>
                </div>
                </div>';
            }
            $nestedData['sts']=$status;
            // $nestedData['created_at']=date('D, d M, Y', strtotime($r->created_at));
            $nestedData['action'] ='<a class="editmdl" data-pid="'.$r->id.'" data-pttl="'.$r->name.'" data-ptopic="'.$r->license_no.'" data-pmobile="'.$r->mobile.'" data-pimg="'.asset('public/uploads/driver/'.$r->profile_picture).'" data-dimg="'.asset('public/uploads/driver/'.$r->license_picture).'" '
                    .  'data-paddress="'.$r->address.'" data-plid="'.$r->license_issue_date.'" data-pled="'.$r->license_expiry_date.'" class="btn btn-warning btn-xs"><i class="ti-pencil-alt success"></i></a> '
                    . '<a href="#" class="delmdl" data-did="'.$r->id.'" data-ttl="'.$r->title.'" style="padding: 4px;"><i class="ficon feather icon-trash-2 danger"></i></a>'.'<a href="'.action('DriverController@show', $r->id).'" class="btn btn-primary btn-xs"><i class="ti-eye"></i></a>&nbsp;';
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

       public function saveDriver(Request $request) 
    {  
        // dd($request->all());
        $company = Company::find(company_id());
        if ($company['drivers_limit']<=0) {
               $notification = array(
                'message' => 'Your have already reached your usages limit. You can upgrade your package !',
                'type' => 'warning'
        );
        }else{
              $profile_picture ="avatar.png";       
        if($request->hasfile('profile_picture'))
        {
             $file = $request->file('profile_picture');
             $profile_picture = "profile_picture".time().'.'.$file->getClientOriginalExtension();
             $file->move(public_path()."/uploads/driver/", $profile_picture);
        }
        $license_picture ="avatar.png";       
        if($request->hasfile('license_picture'))
        {
             $file = $request->file('license_picture');
             $license_picture = "license_picture".time().'.'.$file->getClientOriginalExtension();
             $file->move(public_path()."/uploads/driver/", $license_picture);
        }

        // DB::beginTransaction();
        $driver = new Driver;
        $driver->name = $request->name;
        $driver->mobile = $request->mobile;
        $driver->license_no = $request->license_no;
        $driver->license_issue_date = $request->license_issue_date;
        $driver->license_expiry_date = $request->license_expiry_date;
        $driver->address = $request->address;
        $driver->profile_picture = $profile_picture;
        $driver->license_picture = $license_picture;
        $driver->status=1;
        $driver->company_id = company_id();
        // $events->created_by = Auth::guard('web')->user()->id;
        // $image=$request->file('post_img');
        // if($image)
        // {
        //     $image_name=Str::random(3).$request->title;
        //     $ext=strtolower($image->getClientOriginalExtension());
        //     $image_full_name=$image_name.'.'.$ext;
        //     $upload_path='public/img/blogs/';
        //     $image_url=$upload_path.$image_full_name;
        //     $success=$image->move($upload_path,$image_full_name);
        //     if($success)
        //     {
        //         $events->post_img = $image_url;
        //     }
        // }
        // dd($driver);
        $driver->save();

          //Update Driver Limit      
        // $company = Company::find($driver->company_id);
        // $company->drivers_limit = $company->drivers_limit-1;
       
        // $company->update();
        update_package_limit('drivers_limit');
        // DB::commit();
        $notification = array(
                'message' => 'Driver Saved Successfully',
                'type' => 'success'
        );
        }
        
      
        return Response::json($notification); 
    }

        public function statusDriver(Request $request)
    {
        // dd($request->all());
        $driver= Driver::find($request->id);
        // dd($driver);
        $driver->status = $request->sts;
        $driver->save();
        if($request->sts==1){
            $msg= 'Driver Activated Successfully';
            $type= 'success';
        }else{
            $msg= 'Driver Inactivated Successfully';
            $type= 'warning';
        }
        $notification = array(
                'message' => $msg,
                'type' => $type
            );
        return Response::json($notification); 
    }

         public function updateDriver(Request $request)
    {
        // $contact_image='';
        //          if($request->hasfile('upost_img'))
        // {
        //     $file = $request->file('upost_img');
        //     $contact_image = "profile_picture".time().'.'.$file->getClientOriginalExtension();
        //     $file->move(public_path()."/uploads/contacts/", $contact_image);
        // }
        $driver = Driver::find($request->id);
        $driver->name = $request->utitle;
        // $blog_topic = implode(",", request('topic_id'));
        // $event->topic_id=$blog_topic;
        $driver->mobile = $request->umobile;
        $driver->license_no=$request->ulink;
        $driver->license_issue_date = $request->license_issue_date;
        $driver->license_expiry_date = $request->license_expiry_date;
     
        $driver->address = $request->address;
   
         $image=$request->file('upost_img');
        if($image)
        {
            $image_name=Str::random(3).$request->utitle;
            $ext=strtolower($image->getClientOriginalExtension());
            $image_full_name=$image_name.'.'.$ext;
            $upload_path='public/uploads/driver';
            $image_url=$image_full_name;
            $success=$image->move($upload_path,$image_full_name);
            if($success)
            {
                $driver->profile_picture = $image_url;
                if(file_exists($request->oldimg)){
                    unlink($request->oldimg);
                }
            }   
        }
               
        
        $driver->save();
        $msg = 'Driver Updated Successfully';$typ = 'success';   
        $notification = array('message' => $msg,'type' => $typ);
        return Response::json($notification); 
    }

    public function get_driver_info($id = ''){
        $driver = Driver::where("id",$id)
                          ->where("status",1)
                          ->where("company_id",company_id())->first();
        echo json_encode($driver); 
    }

    public function show(Request $request,$id)
    {
        $company_id = company_id();
        $data = array();

        $data['driver'] = Driver::leftJoin('companies','drivers.company_id','=','companies.id')
                                   ->select('drivers.*','companies.id','companies.business_name')
                                  ->where("drivers.id",$id)
                                  ->where("company_id", $company_id)->first();

        $data['invoices'] = Invoice::where('driver_id',$id)
                                   ->where("company_id", $company_id)
                                   ->get();
        $data['total_booking'] = DB::table('invoices')->where('driver_id',$id)->count();
        $data['total_delivered_booking'] = DB::table('invoices')->where('driver_id',$id)->where('booking_status','delivered')->count();
        $data['total_ongoing_booking'] = DB::table('invoices')->where('driver_id',$id)->where('booking_status','ongoing')->count();

        $data['invoice_value'] = DB::table('invoices')
                                    ->where('driver_id', $id)
                                    ->selectRaw('sum(grand_total) as grand_total, sum(paid) as paid')
                                    ->first();  
        $data['transactions'] = Transaction::leftjoin('invoices as i','i.id','=','transactions.invoice_id')->where('i.driver_id',$id)
                                           ->where("transactions.company_id", $company_id)->get();
                                    
        $data['invoice_due_amount'] = DB::table('invoices')
                                        ->selectRaw('sum(grand_total) as grand_total, sum(paid) as paid')
                                        ->whereRaw("(Status = 'Unpaid' or Status = 'Partially_Paid')")
                                        ->where('driver_id', $id)
                                        ->first();    
       
            return view('backend.driver.view', $data);
        
        
    }


}
