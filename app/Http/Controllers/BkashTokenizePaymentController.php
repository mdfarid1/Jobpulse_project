<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Karim007\LaravelBkashTokenize\Facade\BkashPaymentTokenize;
use Karim007\LaravelBkashTokenize\Facade\BkashRefundTokenize;
use Illuminate\Support\Facades\URL;
use App\PaymentHistory;
use App\EmailTemplate;
use App\Package;
use App\Company;
use App\User;
use Illuminate\Support\Facades\Mail;
use App\Mail\PremiumMembershipMail;
use App\Utilities\Overrider;
use Auth;

class BkashTokenizePaymentController extends Controller
{
    public function index()
    {
        return view('bkashT::bkash-payment');
    }
    public function createPayment(Request $request)
    {
        // dd(base_url());
        $inv = uniqid();
        $request['intent'] = 'sale';
        $request['mode'] = '0011'; //0011 for checkout
        $request['payerReference'] = $request->payment_id;
        $request['currency'] = 'BDT';
        $request['amount'] = 1;//$request->amount;
        $request['merchantInvoiceNumber'] = $inv;
        $request['callbackURL'] =  base_url().'/bkash/callback';

        $request_data_json = json_encode($request->all());

        $response =  BkashPaymentTokenize::cPayment($request_data_json);
    //    dd($response);
        //$response =  BkashPaymentTokenize::cPayment($request_data_json,1); //last parameter is your account number for multi account its like, 1,2,3,4,cont..

        //store paymentID and your account number for matching in callback request
        // dd($response) //if you are using sandbox and not submit info to bkash use it for 1 response

        if (isset($response['bkashURL'])) return redirect()->away($response['bkashURL']);
        else return redirect()->back()->with('error-alert2', $response['statusMessage']);
    }

    public function callBack(Request $request)
    {
        //callback request params
        // paymentID=your_payment_id&status=success&apiVersion=1.2.0-beta
        //using paymentID find the account number for sending params
        // dd($request->all());
        if ($request->status == 'success'){
            // dd($request->all());
            $response = BkashPaymentTokenize::executePayment($request->paymentID);
            //$response = BkashPaymentTokenize::executePayment($request->paymentID, 1); //last parameter is your account number for multi account its like, 1,2,3,4,cont..
            if (!$response){ //if executePayment payment not found call queryPayment
                $response = BkashPaymentTokenize::queryPayment($request->paymentID);
                //$response = BkashPaymentTokenize::queryPayment($request->paymentID,1); //last parameter is your account number for multi account its like, 1,2,3,4,cont..
            }

            if (isset($response['statusCode']) && $response['statusCode'] == "0000" && $response['transactionStatus'] == "Completed") {
                /*
                 * for refund need to store
                 * paymentID and trxID
                 * */
                //  dd($response['payerReference']);
                $payment_id=$response['payerReference'];
                $payment = PaymentHistory::find($payment_id);
                 //$increment = $payment->extend;
                //  dd($payment);
             if( $response['amount'] >= $payment->amount){

                 $company = Company::find($payment->company_id);

                 if($payment->package_type == 'monthly'){
                     $company->valid_to = date('Y-m-d', strtotime('+1 months'));
                 }else{
                     $company->valid_to = date('Y-m-d', strtotime('+1 year'));
                 }

                 $company->membership_type = 'member';
                 $company->last_email = NULL;
                 $company->package_id = $payment->package_id;

                 // 	 Update Package Details
                 $package = $payment->package;
                 $company->staff_limit = 'Unlimited';
                 $company->contacts_limit = unserialize($package->contacts_limit)[$company->package_type];
                //  $company->invoice_limit = unserialize($package->invoice_limit)[$company->package_type];
                //  $company->quotation_limit = unserialize($package->quotation_limit)[$company->package_type];
                //  $company->project_management_module = unserialize($package->project_management_module)[$company->package_type];
                //  $company->recurring_transaction = unserialize($package->recurring_transaction)[$company->package_type];
                //  $company->live_chat = unserialize($package->live_chat)[$company->package_type];
                //  $company->file_manager = unserialize($package->file_manager)[$company->package_type];
                //  $company->online_payment = unserialize($package->online_payment)[$company->package_type];
                 $company->sms_panel = unserialize($package->sms_panel)[$company->package_type];
                //  $company->inventory_module = unserialize($package->inventory_module)[$company->package_type];
                // dd($company);
                 $company->save();

                 // 	Save payment History
                 $payment->method = 'Bkash Payment';
                 $payment->status = 'paid';
                 $payment->save();
                     //Replace paremeter
                //  dd($company);
                 $user = User::where('company_id',$company->id)
                             ->where('user_type','user')
                             ->first();

                 $replace = array(
                     '{name}'=>$user->name,
                     '{email}'=>$user->email,
                     '{valid_to}' =>date('d M,Y', strtotime($company->valid_to)),
                 );

                 //Send email Confrimation
                 Overrider::load("Settings");
                 $template = EmailTemplate::where('name','premium_membership')->first();
                 $template->body = process_string($replace,$template->body);
                 sms_subscription($user,$template->body);
                 sms_subscription_msg_own($user,$payment);
                 // try{
                 // 	Mail::to($user->email)->send(new PremiumMembershipMail($template));
                 // }catch (\Exception $e) {
                 // 	//Nothing
                 // }
                 return BkashPaymentTokenize::success('Thank you for your payment', $response['trxID']);
             }



            }
            return BkashPaymentTokenize::failure($response['statusMessage']);
        }else if ($request->status == 'cancel'){
            return BkashPaymentTokenize::cancel('Your payment is canceled');
        }else{
            return BkashPaymentTokenize::failure('Your transaction is failed');
        }
    }

    public function searchTnx($trxID)
    {
        //response
        return BkashPaymentTokenize::searchTransaction($trxID);
        //return BkashPaymentTokenize::searchTransaction($trxID,1); //last parameter is your account number for multi account its like, 1,2,3,4,cont..
    }

    public function refund(Request $request)
    {
        $paymentID='TR0011lFMvi6H1702286234217'; //TR00110EHk0E51701604639461
        $trxID='ALB0AAGD7Y';
        $amount=1;
        $reason='this is test reason';
        $sku='abc';
        //response
        return BkashRefundTokenize::refund($paymentID,$trxID,$amount,$reason,$sku);
        //return BkashRefundTokenize::refund($paymentID,$trxID,$amount,$reason,$sku, 1); //last parameter is your account number for multi account its like, 1,2,3,4,cont..
    }
    public function refundStatus(Request $request)
    {
        $paymentID='Your payment id';
        $trxID='your transaction no';
        return BkashRefundTokenize::refundStatus($paymentID,$trxID);
        //return BkashRefundTokenize::refundStatus($paymentID,$trxID, 1); //last parameter is your account number for multi account its like, 1,2,3,4,cont..
    }
}
