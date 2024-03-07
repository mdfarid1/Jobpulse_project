<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Company;
use App\Contact;
use App\EmailTemplate;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use App\Utilities\Overrider;
use Carbon\Carbon;
use DB;
use Session;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */

	//protected $redirectTo = '/dashboard';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
		Overrider::load("Settings");
        $this->middleware('guest');
    }

	public function redirectTo(){
		if(auth()->user()->user_type == "user"){
			if(has_membership_system() == 'enabled'){
				if( membership_validity() < date('Y-m-d')){
				    return 'membership/extend';
				}
			}
		}
		return 'admin/dashboard';
	}

	public function showRegistrationForm()
	{
		if(get_option('allow_singup','yes') != 'yes'){
			return redirect('login');
		}else{
			return view('auth.register');
		}
	}
    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'business_name' => ['nullable', 'string', 'max:191'],
            'name' => ['required', 'string', 'max:191'],
            'mobile' => ['required', 'string', 'max:13'],
            'email' => ['required', 'string', 'email', 'max:191', 'unique:users'],
            'password' => ['required', 'string', 'min:6', 'confirmed'],
            'package' => ['nullable'],
            'package_type' => ['nullable'],
            'CaptchaCode' => ['nullable','valid_captcha'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        @ini_set('max_execution_time', 0);
        @set_time_limit(0);

		$trial_period = get_option('trial_period', 14);

		if($trial_period < 1){
			$valid_to = date('Y-m-d', strtotime(date('Y-m-d'). " -1 day"));
		}else{
			$valid_to = date('Y-m-d', strtotime(date('Y-m-d'). " + $trial_period days"));
		}

        DB::beginTransaction();

        //Create Company
        $company = new Company();
        $company->business_name = 'Club Member';
        $company->package_id = 1;
        $company->package_type = 'Basic';
        $company->membership_type = 'member';

        $company->status = 1;
        $company->valid_to = '2090-01-04';

        //Package Details
        $package = $company->package;
        $company->staff_limit = 'Unlimited';
        $company->contacts_limit = 'Unlimited';
        $company->sms_panel = 'no';
        // dd($company);
        $company->save();

         //Create User
        $user = new User();
        $user->name = $data['name'];
        $user->email = $data['email'];
		// if( get_option('email_verification') == 'disabled' ){
		// 	$user->email_verified_at = now();
		// }
        $user->email_verified_at = now();
		$user->mobile=$data['mobile'];
        $user->password = Hash::make($data['password']);
        $user->user_type = 'user';
        $user->status = 0;
        $user->district_id=$data['district_id'];
        $user->upazila_id=$data['upazila_id'];
        $user->profile_picture = 'default.png';
        $user->company_id = $company->id;
        $user->save();
        // sms_send_self($user);
        // DB::table('company_sms_templates')->insert([
		//     [
		// 		'name'=>'Enter',
		// 		'subject'=>'Student Enter',
		// 		'body'=>'<pre class="border border-info p-2">{student_name} প্রতিষ্ঠানে প্রবেশ করেছে {enter_time} | {company_short_name}</pre>',
		// 		'related_to'=>'enter',
		// 		'status'=>1,
        //         'company_id'=>$user->company_id,
		// 		'created_at'=>Carbon::now(),
		// 		'updated_at'=>Carbon::now(),

		// 	],
		// 	[
		// 		'name'=>'Exit',
		// 		'subject'=>'Exit Message',
		// 		'body'=>'<pre class="border border-info p-2">{student_name} - প্রতিষ্ঠান থেকে বের হয়েছে।  {exit_time} | {company_short_name}</pre>',
		// 		'related_to'=>'exit',
		// 		'status'=>1,
        //         'company_id'=>$user->company_id,
		// 		'created_at'=>Carbon::now(),
		// 		'updated_at'=>Carbon::now(),
		// 	],
		// 	[
		// 		'name'=>'Absent',
		// 		'subject'=>'Absent Message',
		// 		'body'=>'<pre class="border border-info p-2">{student_name} আজকে প্রতিষ্ঠানে অনুস্পস্থিত ছিল। {company_short_name}</pre>',
		// 		'related_to'=>'absent',
		// 		'status'=>1,
        //         'company_id'=>$user->company_id,
		// 		'created_at'=>Carbon::now(),
		// 		'updated_at'=>Carbon::now(),
		// 	]
		// ]);

        // DB::table('company_settings')->insert([

		// 	[
		// 		'name'=>'max_entry_time',
		// 		'value'=>60,
        //         'company_id'=>$user->company_id,
		// 		'created_at'=>Carbon::now(),
		// 		'updated_at'=>Carbon::now(),
        //     ],
        //     [
		// 		'name'=>'duration_time',
		// 		'value'=>60,
        //         'company_id'=>$user->company_id,
		// 		'created_at'=>Carbon::now(),
		// 		'updated_at'=>Carbon::now(),
        //     ],

        //     [
		// 		'name'=>'timezone',
		// 		'value'=>'Asia/Dhaka',
        //         'company_id'=>$user->company_id,
		// 		'created_at'=>Carbon::now(),
		// 		'updated_at'=>Carbon::now(),
        //     ],

        //     [
		// 		'name'=>'date_format',
		// 		'value'=>'d-m-Y',
        //         'company_id'=>$user->company_id,
		// 		'created_at'=>Carbon::now(),
		// 		'updated_at'=>Carbon::now(),
        //     ],

        //     [
		// 		'name'=>'time_format',
		// 		'value'=>12,
        //         'company_id'=>$user->company_id,
		// 		'created_at'=>Carbon::now(),
		// 		'updated_at'=>Carbon::now(),
        //     ],

        //     [
		// 		'name'=>'default_holidays',
		// 		'value'=>'Friday,Saturday',
        //         'company_id'=>$user->company_id,
		// 		'created_at'=>Carbon::now(),
		// 		'updated_at'=>Carbon::now(),
        //     ],

        //     [
		// 		'name'=>'instant_absent_sms',
		// 		'value'=>'yes',
        //         'company_id'=>$user->company_id,
		// 		'created_at'=>Carbon::now(),
		// 		'updated_at'=>Carbon::now(),
        //     ],
		// ]);
        // return $user->with('success', _lang('Your account is on hold please contact group admin !'));

        DB::commit();
		return $user;
    }

	public function client_signup(Request $request){
		if($request->isMethod('get')){

			return view('auth.client_signup');

		}else if($request->isMethod('post')){

			$validator = Validator::make($request->all(), [
				'name' => 'required|max:191',
				'email' => 'required|email|unique:users|max:191',
				'password' => 'required|max:20|min:6|confirmed',
			]);

			if ($validator->fails()) {
				if($request->ajax()){
					return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
				}else{
					return back()->withErrors($validator)
								 ->withInput();
				}
			}

			//Create User
			DB::beginTransaction();

			$user = new User();
			$user->name = $request->name;
			$user->email = $request->email;
			if( get_option('email_verification') == 'disabled' ){
				$user->email_verified_at = now();
			}
			$user->password = Hash::make($request->password);
			$user->user_type = 'client';
			$user->status = 1;
			$user->profile_picture = 'default.png';
			$user->save();

			//Update contacts with user_id
			$contact = Contact::where('contact_email',$user->email)
                              ->update(['user_id' => $user->id]);


			DB::commit();

			if($user->id > 0){
			   return redirect('login')->with('registration_success', _lang('Registration Sucessfully. You May Login to your account.'));
			}

		}
	}
}
