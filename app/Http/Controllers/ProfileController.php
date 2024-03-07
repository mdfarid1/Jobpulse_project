<?php

namespace App\Http\Controllers;

use App\Blog;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\User;
use App\Company;
use App\Contact;
use Hash;
use Auth;
use Image;
use DB;
use Illuminate\Support\Facades\Validator;

class ProfileController extends Controller
{
	public function __construct()
    {
		$this->middleware(function ($request, $next) {
			if(has_membership_system() == 'enabled' && Auth::user()->user_type == "user"){
				if( membership_validity() < date('Y-m-d')){
					return redirect('membership/extend')->with('message',_lang('Your membership has expired. Please renew your membership !'));
				}
			}
			return $next($request);
		});
    }

    public function edit()
    {
        $profile = User::with('company')->find(Auth::user()->id);
        return view('backend.profile.profile_edit',compact('profile'));
    }
    public function postlist()
    {
        $postlist = User::with('blogs')->find(Auth::user()->id);
        return view('backend.blog.blog_list',compact('postlist'));
    }



    public function circularUpdate(REQUEST $request,$id){
        $validator = Validator::make($request->all(), [
        //   'category_id' => 'required',
          'title' => 'required',
          'description' => 'required',
  ]);

  if ($validator->fails()) {

      return redirect()->back()
            ->withErrors($validator)
            ->withInput();

  }

        if($request->hasfile('blog_img'))
        {
            $file = $request->file('blog_img');
            $blog_img = "blog_img".time().'.'.$file->getClientOriginalExtension();
            $file->move(public_path()."/uploads/blog/", $blog_img);
        }



    $blog = Blog::find($id);
    // $blog->category_id = $request->category_id;
    $blog->title = $request->title;
    // $blog->slug=SlugService::createSlug(Blog::class, 'slug', $request->title);
    $blog->description = $request->description;
    $blog->status = $request->status;
    if($request->hasfile('blog_img')){
        $blog->blog_img = $blog_img;
    }
    $blog->category	 = $request->category;
    $blog->social_link_fb	 = $request->facebook_link;
    $blog->social_link_gg = $request->google_link;
    $blog->save();
    return redirect('circular/list')->with('success', _lang('Circular Update Sucessfully'));
  }

  public function postedit()
  {
      $data['blog'] =Blog::all();
      $data['category'] = DB::table('category_circulars')->get();
    //   dd($data);
      return view('backend.blog.blog_edit',$data);
  }
    // DB::beginTransaction();

    public function post_update(REQUEST $request){
        // dd($request->all());
        $this->validate($request, [
            'author' => 'required',
            'title' => 'required|max:225',
            'description' => 'string',
            // 'blog_img' => 'required',
            'fblink' => 'max:250',
            'gglink' => 'max:250',

		]);

        $blog = new Blog();
        $blog->user_id =Auth::user()->id;
        $blog->title = $request->title;
        $blog->description = $request->description;
        $blog->status = $request->status;
		if ($request->hasFile('blog_img')){
            $image = $request->file('blog_img');
            $file_name = "blog_".time().'.'.$image->getClientOriginalExtension();
            $image->move(public_path()."/uploads/blog/", $file_name);
            $blog->blog_img = $file_name;
        }
        $blog->social_link_fb = $request->fblink;
        $blog->social_link_gg = $request->gglink;
        $blog->save();
        // dd($blog);
        return redirect('circular/list')->with('success', 'Circular post created successfully!');
    }
    public function update(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => [
                'required',
                Rule::unique('users')->ignore(Auth::User()->id),
            ],
            'profile_picture' => 'nullable|image|max:5120',
            'bio'=>'max:200',
            'business_name'=>'max:20',
            'address'=>'max:50',
            // 'category'=>'required',
            'facebook'=>'max:250',
            'linkedin'=>'max:250',
            'instragram'=>'max:250',
            'tiktok'=>'max:250',

        ]);

        DB::beginTransaction();

        $profile = Auth::user();
        $profile->name = $request->name;
        $profile->email = $request->email;
        $profile->language = $request->language;

		if ($request->hasFile('profile_picture')){
            $image = $request->file('profile_picture');
            $file_name = "profile_".time().'.'.$image->getClientOriginalExtension();
            // Image::make($image)->crop(300, 300)->save(base_path('public/uploads/profile/') .$file_name);
            $image->move(public_path()."/uploads/profile/", $file_name);
            $profile->profile_picture = $file_name;
        }
        $profile->bio = $request->bio;
        $profile->address = $request->address;
        // $profile->category = $request->category;
        $profile->facebook = $request->facebook;
        $profile->linkedin = $request->linkedin;
        $profile->instragram = $request->instragram;
        $profile->tiktok = $request->tiktok;

        $profile->save();


        // Assuming you've already imported necessary classes such as Company and Auth

// Find the company based on the authenticated user's company ID
$company = Company::find(Auth::user()->company_id);

// Check if the $company object exists and the request is not null
if ($company !== null && $request !== null) {
    // Access the business name from the request and update the company's business name
    $company->business_name = $request->business_name;

    // Save the changes to the database
    $company->save();
} else {
    // Handle the case where $company is null or $request is null
    // For example, you could assign a default business name
    $defaultBusinessName = "Default Business Name";

    // If $company is not null, update its business name with the default value
    if ($company !== null) {
        $company->business_name = $defaultBusinessName;
        $company->save();
    }
}



        $request->session()->put('user_language', $profile->language);

        //Update Contact
        if($profile->user_type == 'client'){
            $contact = Contact::where('user_id',$profile->id)
                              ->update(['contact_email' => $profile->email]);
        }

        DB::commit();

        return redirect('profile/edit')->with('success', _lang('Information has been updated'));
    }


    public function circularEdit($id)

    {

        $data['blog']= Blog::leftJoin('category_circulars', 'blogs.category', '=', 'category_circulars.id')
             ->select('blogs.*', 'category_circulars.name as category_name')
             ->find($id);
        // $data['blog']=Blog::find($id);
        // $data['category']=DB::table('category_circulars')->get();
        // dd($data);
        return view('backend.blog.blog_create',$data);
    }



    /**
     * Show the form for change_password the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function change_password()
    {
        return view('backend.profile.change_password');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update_password(Request $request)
    {
        $this->validate($request, [
            'oldpassword' => 'required',
            'password' => 'required|string|min:6|confirmed',
        ]);

        $user = User::find(Auth::User()->id);
        if(Hash::check($request->oldpassword, $user->password)){
            $user->password = Hash::make($request->password);
            $user->save();
        }else{
            return back()->with('error', _lang('Old Password did not match !'));
        }
        return back()->with('success', _lang('Password has been changed'));
    }

}
