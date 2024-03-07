<?php

namespace App\Http\Controllers;

use App\InstituteClass;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Auth;
use App\User;
use App\Invoice;
use App\Quotation;
use App\Transaction;
use App\Contact;
use Hash;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Mail;
use App\Notifications\ContactAccount as ContactAccountNotification;
use App\Mail\GeneralMail;
use App\Utilities\Overrider;
use App\Imports\ContactsImport;
use Maatwebsite\Excel\Facades\Excel;
use DataTables;
use DB;

class InstituteClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
	    $data=array();
		$data['classes']=InstituteClass::leftjoin('contact_groups as cg','cg.id','=','institute_classes.group_id')
		                                 ->select('institute_classes.*','cg.name')
		                                 ->where('institute_classes.company_id',company_id())
										 ->get();
        return view('backend.accounting.class.list',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        if( ! $request->ajax()){
            return view('backend.accounting.class.create');
         }else{
            return view('backend.accounting.class.modal.create');
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
        // dd($request->all());
        $other = InstituteClass::where('class_name',$request->class_name)
                          ->where('company_id',company_id())
                          ->first();

        if( $other ){
        	if($request->ajax()){
			    return response()->json(['result'=>'error','message'=>'Sorry, This class already added !']);
			}else{
				return redirect('contacts/create')->with('error', _lang('Sorry, This class already added !'))->withInput();
			}
        }
		$company_id = company_id();
		DB::beginTransaction();
        $class = new InstituteClass();
		$class->class_name = $request->input('class_name');
		$class->start_time = $request->input('start_time');
		$class->end_time = $request->input('end_time');
		$class->group_id = $request->input('group_id');
	    $class->company_id= $company_id;
        $class->save();


		DB::commit();


		if(! $request->ajax()){
           return redirect('contacts/create')->with('success', _lang('New client added sucessfully'));
        }else{
		   return response()->json(['result'=>'success','action'=>'store','message'=>_lang('New class added sucessfully'),'data'=>$class]);
		}

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\InstituteClass  $instituteClass
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request,$id)
    {
        $company_id = company_id();
    	$data = array();

        $data['class'] = InstituteClass::leftjoin('contact_groups as cg','cg.id','=','institute_classes.group_id')
		                          ->select('institute_classes.*','cg.name')
		                          ->where("institute_classes.id",$id)
						  		  ->where("institute_classes.company_id", $company_id)->first();




		if(! $request->ajax()){
			return view('backend.accounting.class.view',$data);
		}else{
			return view('backend.accounting.class.modal.view',$data);
		}

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\InstituteClass  $instituteClass
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request,$id)
    {
        $class = InstituteClass::leftjoin('contact_groups as cg','cg.id','=','institute_classes.group_id')
		                   ->where("institute_classes.id",$id)
		                  ->where("institute_classes.company_id",company_id())->first();
		if(! $request->ajax()){
		   return view('backend.accounting.class.edit',compact('class','id'));
		}else{
           return view('backend.accounting.class.modal.edit',compact('class','id'));
		}
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\InstituteClass  $instituteClass
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
		$class = InstituteClass::where("id",$id)->where("company_id",company_id())->first();
		$class->class_name=$request->class_name;
		$class->start_time=$request->start_time;
		$class->end_time=$request->end_time;
		$class->group_id=$request->group_id;
		$class->company_id = company_id();

		$class->save();




		if(! $request->ajax()){
           return redirect('income')->with('success', _lang('Updated Sucessfully'));
        }else{
		   return response()->json(['result'=>'success','action'=>'update', 'message'=>_lang('Updated Sucessfully'),'data'=>$class]);
		}
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\InstituteClass  $instituteClass
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $other =   Contact::where('class_id',$id)
                          ->where('company_id',company_id())
                          ->first();

        if( $other ){

			return redirect('classes')->with('error', _lang('Sorry, Students are assigned in this class. You have to change their class or delete them!'))->withInput();

        }
        DB::beginTransaction();
		$class = InstituteClass::where("id",$id)->where("company_id",company_id());
        $class->delete();
		DB::commit();
        return redirect('classes')->with('success',_lang('Removed Sucessfully'));
    }
}
