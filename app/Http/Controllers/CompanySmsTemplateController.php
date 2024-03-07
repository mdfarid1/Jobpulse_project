<?php

namespace App\Http\Controllers;

use App\CompanySmsTemplate;
use Illuminate\Http\Request;
use Validator;
use App\Http\Controllers\Controller;
use DB;
use App\Holiday;
use App\Attendance;
use App\Contact;
use Carbon\Carbon;

class CompanySmsTemplateController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $companysmstemplates = CompanySmsTemplate::where("company_id",company_id())
													 ->orderBy("id","desc")->get();
        return view('backend.accounting.company_sms_template.list',compact('companysmstemplates'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        if( ! $request->ajax()){
            return view('backend.accounting.company_sms_template.create');
         }else{
            return view('backend.accounting.company_sms_template.modal.create');
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
			'related_to' => 'required',
			'name' => 'required|max:191',
			'body' => 'required',
		]);

		if ($validator->fails()) {
			if($request->ajax()){
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return redirect('company_sms_template/create')
							->withErrors($validator)
							->withInput();
			}
		}


        if(in_array($request->name,['Enter','Exit','Absent'])){
        	if($request->ajax()){
			    return response()->json(['result'=>'error','message'=>'Sorry, You cannot give Enter, Exit or Absent as template name !']);
			}else{
				return redirect('company_sms_template/create')->with('error', _lang('Sorry, You cannot give Enter, Exit or Absent as template name !'))->withInput();
			}
        }



        $companysmstemplate = new CompanySmsTemplate();
	    $companysmstemplate->related_to = $request->input('related_to');
	    $companysmstemplate->name = $request->input('name');
		$companysmstemplate->body = $request->input('body');
		$companysmstemplate->company_id = company_id();

        $companysmstemplate->save();

		if(! $request->ajax()){
           return redirect('company_sms_template/create')->with('success', _lang('Saved Sucessfully'));
        }else{
		   return response()->json(['result'=>'success','action'=>'store','message'=>_lang('Saved Sucessfully'),'data'=>$companyemailtemplate]);
		}
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\CompanySmsTemplate  $companySmsTemplate
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request,$id)
    {
        $companysmstemplate = CompanySmsTemplate::where("id",$id)
													->where("company_id",company_id())->first();
		if(! $request->ajax()){
		    return view('backend.accounting.company_sms_template.view',compact('companysmstemplate','id'));
		}else{
			return view('backend.accounting.company_sms_template.modal.view',compact('companysmstemplate','id'));
		}

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\CompanySmsTemplate  $companySmsTemplate
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request,$id)
    {
        $companysmstemplate = CompanySmsTemplate::where("id",$id)
        ->where("company_id",company_id())->first();
        if(! $request->ajax()){
        return view('backend.accounting.company_sms_template.edit',compact('companysmstemplate','id'));
        }else{
        return view('backend.accounting.company_sms_template.modal.edit',compact('companysmstemplate','id'));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\CompanySmsTemplate  $companySmsTemplate
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $validator = Validator::make($request->all(), [
			'related_to' => 'required',
			'name' => 'required|max:191',

			'body' => 'required',
		]);

		if ($validator->fails()) {
			if($request->ajax()){
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return redirect()->route('company_sms_template.edit', $id)
							->withErrors($validator)
							->withInput();
			}
		}

        // if(in_array($request->name,['Enter','Exit','Absent'])){
        // 	if($request->ajax()){
		// 	    return response()->json(['result'=>'error','message'=>'Sorry, You cannot give Enter, Exit or Absent as template name !']);
		// 	}else{
		// 		return redirect()->back()->with('error', _lang('Sorry, You cannot give Enter, Exit or Absent as template name !'))->withInput();
		// 	}
        // }

        $companysmstemplate = CompanySmsTemplate::where("id",$id)->where("company_id",company_id())->first();
		$companysmstemplate->related_to = $request->input('related_to');
		$companysmstemplate->name = $request->input('name');

		$companysmstemplate->body = $request->input('body');
		$companysmstemplate->status = $request->input('status');
		$companysmstemplate->company_id = company_id();

        $companysmstemplate->save();

		if(! $request->ajax()){
           return redirect('company_sms_template')->with('success', _lang('Updated Sucessfully'));
        }else{
		   return response()->json(['result'=>'success','action'=>'update', 'message'=>_lang('Updated Sucessfully'),'data'=>$companyemailtemplate]);
		}
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\CompanySmsTemplate  $companySmsTemplate
     * @return \Illuminate\Http\Response
     */
    public function destroy(CompanySmsTemplate $companySmsTemplate)
    {
        //
    }

    public function get_template($id){
		$companysmstemplate = CompanySmsTemplate::where("id",$id)
													->where("company_id",company_id())->first();
	    echo json_encode($companysmstemplate);
	}

    public function send_sms(Request $request,$view = ""){
		if($view == ''){
            return view('backend.accounting.company_sms_template.sms_send_absent');
        }else{


            $class_id = $request->class_id;
            $company_id = company_id();
            $today = date('Y-m-d');
            $data = array();

            $data['report_data'] = DB::select("SELECT A.contact_name, A.contact_phone, A.class_id, A.reg_no
            FROM contacts AS A LEFT JOIN attendances AS B ON A.class_id = B.class_id  AND A.reg_no = B.student_id
            AND DATE(B.created_at) ='$today' WHERE A.company_id =$company_id AND A.class_id = $class_id AND B.entry_at IS NULL;");
            // dd($data['report_data']);
            if(count($data['report_data'])==0){
                return redirect()->back()->with('success', _lang('Everyone is present at this class!'));
            }else{

                sms_send_student($data['report_data']);
                return redirect()->back()->with('success', _lang('SMS Sent Sucessfully to ').count($data['report_data']).' Guardian.' );
            }



        }
	}
}
