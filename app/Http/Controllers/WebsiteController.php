<?php

namespace App\Http\Controllers;

use App\Blog;
use Illuminate\Http\Request;
use App\Package;
use App\EmailSubscriber;
use App\Faq;
use App\Item;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContactUs;
use App\Models\Carousel;
use App\Models\Category_circular;
use App\Models\Circular;
use App\Models\Gallery;
use App\Utilities\Overrider;
use Devfaysal\BangladeshGeocode\Models\District;
use Devfaysal\BangladeshGeocode\Models\Upazila;
use DB;
use Auth;
use Validator;

class WebsiteController extends Controller
{

	public function __construct()
    {
		if(env('APP_INSTALLED',true) == true){
			$this->middleware(function ($request, $next) {
				if( get_option('website_enable','yes') == 'no' ){
					return redirect('login');
				}
                if(isset($_GET['language'])){
                    session(['language' => $_GET['language']]);
                    return back();
                }
				return $next($request);
			});

			date_default_timezone_set(get_option('timezone','Asia/Dhaka'));
		}
    }

    /**
     * Show the website frontpage.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data=array();
        $data['blog']=Blog::orderBy('id','desc')->get();
        $data['circuler_category']=Category_circular::orderBy('id','desc')->get();

        //  dd($data['blog']);
        $data['faqs'] = Faq::all()->sortByDesc("id");
        $data['items'] = Item::all();
        $data['Circular']=Circular::orderBy('id','desc')->get();
        $data['carusel'] = Carousel::all();
        $data['gallery'] = Gallery::orderBy('id','desc')->get();



    // dd($data);
	    return view('theme.default.index',$data);
    }

    /**
     * Show the website frontpage.
     *
     * @return \Illuminate\Http\Response
     */
    public function sign_up()
    {
        if(! Auth::check() && get_option('allow_singup','yes') == 'yes'){
            $data=array();
            $data['districts'] = District::all()->pluck('name', 'id');
            return view('theme.default.sign_up',$data);
        }

        return redirect('/');
    }

     /**
     * Show the website frontpage.
     *
     * @return \Illuminate\Http\Response
     */
    public function site($page = '')
    {
        $theme = get_option('active_theme','default');

        if( file_exists( resource_path() . "/views/theme/$theme/template/$page.blade.php") ){
            return view("theme.$theme.template.$page");
        }else{
            abort(404);
        }
    }

    public function emaiL_subscribed(Request $request){

        $validator = Validator::make($request->all(), [
            'email' => 'required|email|unique:cm_email_subscribers|max:191',
        ],[
          'email.unique' => _lang('Sorry, You have already subscribed !')
        ]);

        if ($validator->fails()) {
            if($request->ajax()){
                return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
            }else{
                return back()->withErrors($validator)->withInput();
            }
        }

        $email_subscriber = new EmailSubscriber();
        $email_subscriber->email = $request->email;
        $email_subscriber->ip_address = request()->ip();
        $email_subscriber->save();

        if(! $request->ajax()){
           return back()->with('success', _lang('Thank you for subscription'));
        }else{
           return response()->json(['result'=>'success', 'action'=>'store', 'message'=>_lang('Thank you for subscription'),'data'=>$emaiL_subscriber]);
        }

    }

    public function send_message(Request $request)
    {
       @ini_set('max_execution_time', 0);
       @set_time_limit(0);
       Overrider::load("Settings");

       $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email',
            'subject' => 'required',
            'message' => 'required',
            'CaptchaCode' => 'required|valid_captcha'
       ]);

        //Send Email
        $name = $request->input("name");
        $email = $request->input("email");
        $subject = $request->input("subject");
        $message = $request->input("message");

        $mail  = new \stdClass();
        $mail->name = $name;
        $mail->email = $email;
        $mail->subject = $subject;
        $mail->message = $message;


        if(get_option('contact_email') != ''){
            // dd(get_option('contact_email'));
            try{
                Mail::to(get_option('contact_email'))->send(new ContactUs($mail));
                echo json_encode(array('result'=>true,'message'=>_lang('Your Message send sucessfully.')));
            }catch (\Exception $e) {
                // dd($e);
                echo json_encode(array('result'=>false,'message'=>_lang('Error Occured, Please try again !')));
            }
        }

    }

    public function get_districts(Request $request)
    {
       // dd($request->all());
        if (!$request->division_id) {
            $html = '<option value="">'._lang('Please Select').'</option>';
        } else {
            $html = '<option value="">Select District</option>';
            $districts = District::where('division_id', $request->division_id)->get();
            foreach ($districts as $district) {
                $html .= '<option value="'.$district->id.'">'.$district->name.'</option>';
            }
        }

        return response()->json(['html' => $html]);
    }

    public function get_upazilas(Request $request)
    {
       // dd($request->all());
        if (!$request->district_id) {
            $html = '<option value="">'._lang('Please Select').'</option>';
        } else {
            $html = '<option value="">Select Upazila</option>';
            $upazilas = Upazila::where('district_id', $request->district_id)->get();
            foreach ($upazilas as $upazila) {
                $html .= '<option value="'.$upazila->id.'">'.$upazila->name.'</option>';
            }
        }

        return response()->json(['html' => $html]);
    }


}
