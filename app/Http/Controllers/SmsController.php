<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\CompanySetting;
use App\SMS;
use Carbon\Carbon;
use Validator;
use Illuminate\Validation\Rule;
use DB;

class SmsController extends Controller
{
   public function __construct(){
        header('Cache-Control: no-cache');
        header('Pragma: no-cache');
    }


    public $templates = [
        1 => 'Member creation sms',
        2 => 'New general deposit conformation',
        3 => 'Withdraw  from General deposit confirmation',
        4 => 'Dps account opening sms',
        5 => 'Dps savings deposit sms',
        6 => 'Dps withdrawal sms',
        7 => 'Dps closing sms',
        8 => 'Loan create sms',
        9 => 'Installment collection sms',
        10 => 'Loan closing sms',
        11 => 'FDR opening sms (Monthly)',
        12 => 'FDR profit distribution sms',
        13 => 'FDR closing sms',
        14 => 'CC Loan Create (Monthly)',
        15 => 'CC Loan Create (Fixed)',
        16 => 'CC Loan Installment Pay',
        17 => 'CC Loan Closing',
        18 => 'FDR opening sms (Fixed)',

        21 => 'Profit Distribution SMS',
        22 => 'Out Loan Transection deposit',
        23 => 'Salary Transection',
        24 => 'Director Transection deposit',
        25 => 'Share Transection depost',
        26 => 'Out Loan Transection Payment',
        27 => 'Director Transection Payment',
        28 => 'Share Transection Withdraw',
        29 => 'Daily RP Alert',
        31 => 'Transfer SMS (Pending)',
        32 => 'Transfer SMS (Cancel)',
        33 => 'Transfer SMS (Sender)',
        34 => 'Transfer SMS (Receiver)',

        100 => 'Staff Fund Withdraw SMS',
        101 => 'Staff Fund Deposit SMS',
        102 => 'FDR Balance Deposit SMS',
        103 => 'FDR Balance Withdraw SMS',

    ];

    public function prepare($temp, $data)
    {
        $template = SMS::where('template', $temp)->first();
        // if (!$template) {
        //     $template = Notification::where('template', 20)->where('id', $temp)->first();
        //     if (!$template) {
        //         Session::put(['message.error' => __('sms.sms_template_not_found')]);
        //         return null;
        //     }
        // } elseif (!$template->active) {
        //     Session::put(['message.error' => __('sms.sms_template_not_active')]);
        //     return null;
        // }
        $body = $template->body;
        if (is_array($data) || is_object($data)) {
            foreach ($data as $key => $value) {
                $body = str_replace("[" . strtoupper($key) . "]", $value, $body);
            }
        }
        $dataType = ['account', 'amount', 'balance', 'bank', 'branch', 'close', 'credit', 'date', 'deposit', 'due', 'discount', 'debit', 'expense', 'expire', 'installment', 'link', 'loan', 'member', 'month', 'penalty', 'profit', 'password', 'previous', 'sequence', 'start', 'target', 'title', 'username', 'vat', 'withdraw', 'year'];
        foreach ($dataType as $type) {
            $body = str_replace("[" . strtoupper($type) . "]", "✘", $body);
        }

        return $body;
    }


    public function send($template, $mobile, $data)
    {
        if (!$mobile) {
            Session::put('error', __('sms.mobile_number_not_found_to_send_sms'));
            return null;
        }
        $permission = SystemHelper::info('sms');
        if ($permission) {
            if ($template !== 0) {
                if (!$this->prepare($template, $data)) {
                    return 'fail';
                }
                $body = str_replace(' ', '%20', $this->prepare($template, $data));
            } else {
                $body = str_replace(' ', '%20', $data);
            }
            $body = str_replace("\r\n", '%0A', $body);

            $url = SystemHelper::info('sms_api');

            $url = str_replace("[K]", SystemHelper::info('sms_key'), $url);
            $url = str_replace("[U]", SystemHelper::info('sms_username'), $url);
            $url = str_replace("[P]", SystemHelper::info('sms_password'), $url);
            $url = str_replace("[F]", SystemHelper::info('sms_from'), $url);
            $url = str_replace("[T]", $mobile, $url);
            $url = str_replace("[M]", $body, $url);


            $req = curl_init();
            curl_setopt($req, CURLOPT_URL, $url);
            curl_setopt($req, CURLOPT_VERBOSE, 1);
            curl_setopt($req, CURLOPT_RETURNTRANSFER, 1);

            $response = curl_exec($req);
            // dd($response);

            $e = explode('/', $url);
            // dd($e);
            $api_url = $e[2];

            if ($api_url == 'login.bulksmsgateway.in') {
                // Indian bulk sms gateway integrated
                $log['moment'] = Carbon::now();
                $log['mobile'] = $mobile;
                $log['status'] = 'fail';
                $log['from'] = '';
                $log['message_body'] = $body;
                $log['message_id'] = null;
                $log['error_code'] = null;
                $log['error_text'] = null;
                $log['sms_count'] = null;
                $log['credit'] = null;
                $log['send'] = 0;
                $return = 'fail';

                if ($response) {
                    $response = json_decode($response);

                    //  +status": "success"
//  +"mobilenumbers": "9987199871"
//  +"remainingcredits": 9995
//  +"msgcount": 1
//  +"selectedRoute": "transactional"
//  +"refid": 185036945938604229
//  +"senttime": "2021-01-30 10:57:54"
//  +"response": array:1 [▶]

                    if ($response->status == 'success') {
                        $log['status'] = 'success';
                        $log['send'] = 1;
                        $log['sms_count'] = $response->msgcount ?? null;
                        $log['message_id'] = $response->refid ?? null;
                        $log['credit'] = $response->remainingcredits ?? null;
                        $return = 'success';
                    } else {
                        $log['error_text'] = $response->response;
                        $log['status'] = 'failed';
                        $log['send'] = 0;
                    }
                } else {
                    $log['status'] = 'disconnect';
                    $log['error_text'] = "Can not connect to the server";
                    $log['message_id'] = '';
                    $log['send'] = 0;
                    $return = 'error';
                }
            } elseif ($api_url == '66.45.237.70') {
                $log['moment'] = Carbon::now();
                $log['mobile'] = $mobile;
                $log['status'] = 'fail';
                $log['from'] = '';
                $log['message_body'] = $body;
                $log['message_id'] = null;
                $log['error_code'] = null;
                $log['error_text'] = null;
                $log['sms_count'] = null;
                $log['credit'] = null;
                $log['send'] = 0;
                $return = 'fail';
                if ($response) {
                    $errors = [1000 => "Invalid user or Password", 1002 => "Empty Number", 1003 => "Invalid message or empty message", 1004 => "Invalid number", 1005 => "All Number is Invalid ", 1006 => "insufficient Balance ", 1009 => "Inactive Account", 1010 => "Max number limit exceeded", 1101 => "Success"];
                    $res = explode('|', $response);
                    if (array_key_exists($res[0], $errors)) {
                        $log['error_text'] = $errors[$res[0]];
                        $log['status'] = 'success';
                        if (isset($res[1])) {
                            $log['message_id'] = $res[1];
                        }
                        $log['send'] = 1;
                        $return = 'success';
                    } else {
                        $log['error_text'] = "Unknown Error";
                    }
                    // $log['error_code'] = $res[0];
                } else {
                    $res_e = explode("|", $response);
                    if ($res_e[0] == 1101) {
                        $log['status'] = 'success';
                        // $log['message_id'] = $res_e[1];
                        if (isset($res_e[1])) {
                            $log['message_id'] = $res_e[1];
                        }
                        $log['send'] = 1;
                        $return = 'success';
                    } else {
                        $log['status'] = 'disconnect';
                        $log['error_text'] = "Can not connect to the server";
                        $log['status'] = 'fail';
                        $log['message_id'] = '';
                        $log['send'] = 0;
                        $return = 'error';
                    }
                }
            } elseif ($api_url == 'bangladeshsms.com') {
                // bangladeshsms.com condition implemention here
                $log['moment'] = Carbon::now();
                $log['mobile'] = $mobile;
                $log['status'] = 'fail';
                $log['from'] = SystemHelper::info('sms_from');
                $log['message_body'] = $body;
                $log['message_id'] = null;
                $log['error_code'] = null;
                $log['error_text'] = null;
                $log['sms_count'] = null;
                $log['credit'] = null;
                $log['send'] = 0;
                $return = 'fail';
                // dd($response);
                if ($response) {
                    libxml_use_internal_errors(true);
                    $xml = simplexml_load_string($response);

                    if ($xml) {
                        $response = curl_exec($req);

                        $dom = new \DOMDocument();
                        $dom->loadXML($response);
                        $StatusText = $dom->getElementsByTagName('StatusText')->item(0)->nodeValue;
                        $Status = $dom->getElementsByTagName('Status')->item(0)->nodeValue;
                        $MessageId = $dom->getElementsByTagName('MessageId')->item(0)->nodeValue;
                        $ErrorCode = $dom->getElementsByTagName('ErrorCode')->item(0)->nodeValue;
                        $SMSCount = $dom->getElementsByTagName('SMSCount')->item(0)->nodeValue;
                        $CurrentCredit = $dom->getElementsByTagName('CurrentCredit')->item(0)->nodeValue;
                        $ErrorText = $dom->getElementsByTagName('ErrorText')->item(0)->nodeValue;

                        $log['status'] = $StatusText;
                        $log['message_id'] = $MessageId;
                        $log['error_code'] = $ErrorCode;
                        $log['error_text'] = $ErrorText;
                        $log['sms_count'] = $SMSCount;
                        $log['credit'] = $CurrentCredit;

                        if ($Status == 0) {
                            $log['send'] = 1;
                            $return = 'success';
                        }
                    } elseif (is_numeric($response)) {
                        $errors = [1002 => "Sender Id/Masking Not Found", 1003 => "API Not Found", 1004 => "SPAM Detected", 1005 => "Internal Error", 1006 => "Internal Error", 1007 => "Balance Insufficient", 1008 => "Message is empty", 1009 => "Message Type Not Set (text/unicode)", 1010 => "Invalid User & Password", 1011 => "Invalid User Id"];
                        if (array_key_exists($response, $errors)) {
                            $log['error_text'] = $errors[$response];
                        } else {
                            $log['error_text'] = "Unknown Error";
                        }
                        $log['error_code'] = $response;
                    } else {
                        $log['status'] = 'success';
                        $log['message_id'] = explode(" - ", $response)[1];
                        $log['send'] = 1;
                        $return = 'success';
                    }
                } else {
                    $log['status'] = 'disconnect';
                    $log['error_text'] = "Can not connect to the server";
                }
            } //bangladeshsms.com sms api condition end


            // dd($log);
            if (isset($mobile) && !null == $mobile) {
                try {
                    NotificationLog::create($log);
                } catch (\PDOException $e) {
                    Session::put(['message.error' => $e->getMessage()]);
                }
            } else {
                parent::message('error', __('sms.mobile_number_not_found_to_send_sms'));
            }
            return $return;
        } elseif ($this->sendCompanySms && $template == 29 && check_subscribtion() != false) {

            if (!$this->prepare($template, $data)) {
                return 'fail';
            }
            $body = str_replace(' ', '%20', $this->prepare($template, $data));

            $body = str_replace("\r\n", '%0A', $body);

            $dSmsUrl = 'http://66.45.237.70/api.php';

            $dApi['username'] = 'autosms';
            $dApi['password'] = 'rz4yanh2';
            $dApi['number'] = $mobile;
            $dApi['message'] = urldecode($body);

            Http::get($dSmsUrl, $dApi);
        }
    }

     public function settings(Request $request,$store="")
    {

       if($store == ""){
           return view('backend.accounting.general_settings.sms_settings');
        }else{
            // dd($request->all());
            // dd($_POST);
            $company_id = company_id();
            foreach($_POST as $key => $value){
                 if($key == "_token"){
                     continue;
                 }

                 $data = array();
                 $data['value'] = $value;
                 $data['company_id'] = $company_id;
                 $data['updated_at'] = Carbon::now();

                 if(CompanySetting::where('name', $key)->where("company_id",$company_id)->exists()){
                    CompanySetting::where('name','=',$key)
                                  ->where("company_id",$company_id)
                                  ->update($data);
                 }else{
                    $data['name'] = $key;
                    $data['created_at'] = Carbon::now();
                    CompanySetting::insert($data);
                 }
            } //End Loop

            \Cache::forget('base_currency'.session('company_id'));
            \Cache::forget('currency_position'.session('company_id'));

            if(! $request->ajax()){
               return redirect('sms/sms_settings')->with('success', _lang('Saved Sucessfully'));
            }else{
               return response()->json(['result'=>'success','action'=>'update','message'=>_lang('Saved Sucessfully')]);
            }

        }


    }



    public function index()
    {
        // dd('test');
        $companysmstemplates = SMS::where("company_id",company_id())
                                ->orderBy("id","desc")
                                ->get();
        return view('backend.accounting.company_sms_template.list',compact('companysmstemplates'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
         // dd('test');
        if( ! $request->ajax()){
           return view('backend.accounting.company_sms_template.create');
        }else{
           return view('backend.accounting.company_sms_template.modal.create');
        }
    }

   //  /**
   //   * Store a newly created resource in storage.
   //   *
   //   * @param  \Illuminate\Http\Request  $request
   //   * @return \Illuminate\Http\Response
   //   */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:191',
            'body' => 'required',
        ]);

        if ($validator->fails()) {
            if($request->ajax()){
                return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
            }else{
                return redirect()->route('sms.index')
                            ->withErrors($validator)
                            ->withInput();
            }
        }



        $companysmstemplate = new SMS();
        // $companysmstemplate->related_to = $request->input('related_to');
        $companysmstemplate->name = $request->input('name');
        // $companysmstemplate->subject = $request->input('subject');
        $companysmstemplate->body = $request->input('body');
        $companysmstemplate->status = 1;
        $companysmstemplate->company_id = company_id();

        $companysmstemplate->save();

        if(! $request->ajax()){
           return redirect()->route('sms.create')->with('success', _lang('Saved Sucessfully'));
        }else{
           return response()->json(['result'=>'success','action'=>'store','message'=>_lang('Saved Sucessfully'),'data'=>$companysmstemplate]);
        }

   }


   //  /**
   //   * Display the specified resource.
   //   *
   //   * @param  int  $id
   //   * @return \Illuminate\Http\Response
   //   */
   //  public function show(Request $request,$id)
   //  {
   //      $companyemailtemplate = CompanyEmailTemplate::where("id",$id)
   //                                                  ->where("company_id",company_id())->first();
   //      if(! $request->ajax()){
   //          return view('backend.accounting.company_email_template.view',compact('companyemailtemplate','id'));
   //      }else{
   //          return view('backend.accounting.company_email_template.modal.view',compact('companyemailtemplate','id'));
   //      }

   //  }

   //  /**
   //   * Show the form for editing the specified resource.
   //   *
   //   * @param  int  $id
   //   * @return \Illuminate\Http\Response
   //   */
    public function edit(Request $request,$id)
    {
         // dd($id);
        $companysmstemplate = Sms::where("id",$id)->where("company_id",company_id())->first();

        if(! $request->ajax()){
           return view('backend.accounting.company_sms_template.edit',compact('companysmstemplate','id'));
        }else{
           return view('backend.accounting.company_sms_template.modal.edit',compact('companysmstemplate','id'));
        }

    }

   //  /**
   //   * Update the specified resource in storage.
   //   *
   //   * @param  \Illuminate\Http\Request  $request
   //   * @param  int  $id
   //   * @return \Illuminate\Http\Response
   //   */
    public function update(Request $request,$id)
    {
         // dd($request->all());
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'body' => 'required',
        ]);

        if ($validator->fails()) {
            if($request->ajax()){
                return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
            }else{
                return redirect()->route('company_email_template.edit', $id)
                            ->withErrors($validator)
                            ->withInput();
            }
        }

        $companysmstemplate = Sms::where("id",$id)->where("company_id",company_id())->first();
        $companysmstemplate->name = $request->input('name');
        $companysmstemplate->status = $request->input('status');
        $companysmstemplate->body = $request->input('body');
        $companysmstemplate->save();

        if(! $request->ajax()){
           return redirect()->route('sms.index')->with('success', _lang('Updated Sucessfully'));
        }else{
           return response()->json(['result'=>'success','action'=>'update', 'message'=>_lang('Updated Sucessfully'),'data'=>$companysmstemplate]);
        }

    }

   //  /**
   //   * Remove the specified resource from storage.
   //   *
   //   * @param  int  $id
   //   * @return \Illuminate\Http\Response
   //   */
   //  public function destroy($id)
   //  {
   //      $companyemailtemplate = CompanyEmailTemplate::where("id",$id)
   //                                                  ->where("company_id",company_id());
   //      $companyemailtemplate->delete();
   //      return redirect('company_email_template')->with('success',_lang('Deleted Sucessfully'));
   //  }

   //  public function get_template($id){
   //      $companyemailtemplate = CompanyEmailTemplate::where("id",$id)
   //                                                  ->where("company_id",company_id())->first();
   //      echo json_encode($companyemailtemplate);
   //  }
}
