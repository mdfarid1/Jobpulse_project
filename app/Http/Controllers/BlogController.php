<?php

namespace App\Http\Controllers;

use App\Blog;
use App\Blog_category;
use App\Models\Carousel;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Gallery;
// use App\Models\carousel;
use App\User;
use Validator;
use Cviebrock\EloquentSluggable\Services\SlugService;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class BlogController extends Controller
{

    //blog page
    public function view($id){
        // $data=array();
        $blog = DB::table('blogs')
        ->leftJoin('category_circulars', 'blogs.category', '=', 'category_circulars.id')
        ->select('blogs.*', 'category_circulars.name as category_name')
        ->where('blogs.id', $id)  // Assuming $id is the ID of the blog post you want to retrieve
        ->first();
        // dd($blog);
        // $blog=Blog::with('user')->find($id);
        $data['blog']=$blog;
        $data['prev']=Blog::where('status',2)
                            // ->where('category_id',$blog->category_id)
                            ->where('id','<',$blog->id)
                            ->orderBy('id','desc')
                            ->first();
      $data['next']=Blog::where('status',2)
                            // ->where('category_id',$blog->category_id)
                            ->where('id','>',$blog->id)
                            ->first();
        // dd($data);
        return view('theme.default.template.blog_category_view',$data);
    }

    //category page
    public function post(){
        $data=array();
        $data['posts'] = DB::table('blogs')
        ->leftJoin('category_circulars', 'blogs.category', '=', 'category_circulars.id')
        ->select('blogs.*', 'category_circulars.name as category_name')
        ->orderBy('blogs.id', 'desc')
        ->paginate(18);
        // $data['category']
        // dd($data);
        return view('theme.default.template.blog',$data);
    }

    // //category view page
    // public function category_view($slug){
    //   // dd($slug);
    //   $data=array();
    //   $blog=Blog::findBySlug($slug);
    //   //dd($blog->category_id);
    //   $data['blog']=$blog;
    //   $data['prev']=Blog::where('status',1)
    //                         ->where('category_id',$blog->category_id)
    //                         ->where('id','<',$blog->id)
    //                         ->orderBy('id','desc')
    //                         ->first();
    //   $data['next']=Blog::where('status',1)
    //                         ->where('category_id',$blog->category_id)
    //                         ->where('id','>',$blog->id)
    //                         ->first();
    //  //dd($data['prev']);
    //   return view('theme.default.template.blog_category_view',$data);
    // }

    // //blog add page super admin
    // public function blog_base(){
    //     return view('theme.default.theme_option.blog_base');
    // }

    // //blog view page super admin
    public function postshow(){
        $data=array();
        $data['posts']= Blog::orderBy('id','desc')->with('user')->paginate(10);
        return view('theme.default.theme_option.blog_show',$data);
    }

    // //blog blogcategory page super admin
    // public function blogcategory(){
    //     return view('theme.default.theme_option.blogcategory');
    // }

    // //blog blogcategory view page super admin
    // public function blogcategoryview(){
    //     $data=array();
    //     $data['category']=Blog_category::all();
    //     return view('theme.default.theme_option.blogcategoryview',$data);
    // }

    // //blog category add validation
    // public function blogcategorycreate(REQUEST $request){
    //   $rule = [
    //     'category_title' => 'required|min:5|max:70',
    //     'category_description' => 'required|min:30|max:200',
    //     'company_id' => 'required',
    //   ];
    //   $this->validate($request , $rule);

    //   $category = new Blog_category();
    //   $category->category_name = $request->category_title;
    //   $category->category_description = $request->category_description;
    //   $category->img = $request->img;
    //   $category->company_id = $request->company_id;
    //   $category->save();
    //   return redirect('/blogcategoryview')->with('success', _lang('Saved Sucessfully'));
    // }



    //blog add validation
    // public function post_create(REQUEST $request){
    //     // dd($request->all());
    //     $request->validate([
    //         'title' => 'required|max:225',
    //         'description' => 'required|string',
    //         'blog_img' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
    //         'fblink' => 'required|min:50',
    //         'gglink' => 'required|min:50',

	// 	]);
    //     $file = $request->file('blog_img');
    //     $blog_img = "blog_img".time().'.'.$file->getClientOriginalExtension();
    //     $file->move(public_path()."/uploads/blogs/", $blog_img);

    //     // $imagePath = $request->file('image')->store('blog_images', 'public');

    //     Blog::create([
    //         'title' => $request->input('title'),
    //         'description' => $request->input('description'),
    //         'blog_img' => $request->input('blog_img'),
    //         'social_link_fb' => $request->input('fblink'),
    //         'social_link_gg' => $request->input('gglink'),
    //     ]);

    //     return redirect('/')->with('success', 'Blog post created successfully!');
    // }
        //   $validator = Validator::make($request->all(), [
        //     'title' => 'required|max:150',
        //     'description' => 'required|min:500',
        //     'fblink' => 'required|min:50',
        //     'gglink' => 'required|min:50',

		// ]);

		// if ($validator->fails()) {

		// 		return redirect()->back()
		// 					->withErrors($validator)
		// 					->withInput();

		// }


        // $file = $request->file('blog_img');
        // $blog_img = "blog_img".time().'.'.$file->getClientOriginalExtension();
        // $file->move(public_path()."/uploads/blogs/", $blog_img);


    //   $blog = new Blog();
    //   $blog->title = $request->title;
    //   $blog->description = $request->description;
    //   $blog->blog_img = $blog_img;
    //   $blog->social_link_fb	 = $request->fblink;
    //   $blog->social_link_gg = $request->gglink;
    //   $blog->save();
    //   return redirect('/blog')->with('success', _lang('Saved Sucessfully'));
    // }

    //blog edit validation
     public function blogedit($id){
        $data=array();
        $data['blogs']=Blog::find($id);
        $data['category'] = DB::table('category_circulars')->get();
        // dd($data);
      return view('theme.default.theme_option.blogedit',$data);
     }


     //blog update validation
    public function blogupdate(REQUEST $request,$id){
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
    return redirect('circular/show')->with('success', _lang('Circular Update Sucessfully'));
  }





  public function deletePost(Request $request, $id)
{
    // Find the blog post by ID
    $post = Blog::find($id);

    // Check if the post exists
    if ($post) {
        // Delete the post
        $post->delete();

        // Optionally, you may want to add a success message
        return redirect('circular/show')->with('success', 'Blog post deleted successfully.');
    }

    // If the post doesn't exist, redirect with an error message
    return redirect('circular/show')->with('error', 'Blog post not found.');
}



public function deleteCircular(Request $request, $id)
{
    // Find the blog post by ID
    $circular = Blog::find($id);

    // Check if the post exists
    if ($circular) {
        // Delete the post
        $circular->delete();

        // Optionally, you may want to add a success message
        return redirect('circular/list')->with('success', 'Circular deleted successfully.');
    }

    // If the post doesn't exist, redirect with an error message
    return redirect('circular/list')->with('error', 'Circular not found.');
}










public function carusel()
{
    $carusel =Carousel::all();
    return view('theme.default.theme_option.carousellist',compact('carusel'));
}

public function editcarusel($id)
{
    $carusel =Carousel::find($id);
    return view('theme.default.theme_option.caruseledit',compact('carusel'));
}

public function updatecarusel(Request $request, $id)
{
    $validator = Validator::make($request->all(), [
        'name' => 'required',
        'description' => 'required',
    ]);


    if ($validator->fails()) {
        if($request->ajax()){
            return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
        }else{
            return redirect()->route('services.edit', $id)
                        ->withErrors($validator)
                        ->withInput();
        }
    }

    if($request->hasfile('img'))
    {
        $file = $request->file('img');
        $img = "img".time().'.'.$file->getClientOriginalExtension();
        $file->move(public_path()."/uploads/carusel/", $img);
    }
    //Update item
    // DB::beginTransaction();
    $carusel = Carousel::find($id);
    if($carusel){
        $carusel->name = $request->input('name');
        $carusel->description = $request->input('description');
        if($request->hasfile('img')){
            $carusel->img = $img;
        }
        // $item->company_id = company_id();
        $carusel->save();


        // $service = Service::where("item_id",$id)->first();
        // $service->item_id = $item->id;
        // $service->cost = $request->input('cost');
        // $service->tax_method = 'exclusive';
        // //$service->tax_id = $request->input('tax_id');
        // $service->description = $request->input('description');

        // $service->save();
        // DB::commit();
    }else{
        if(! $request->ajax()){
            return redirect('/carusel')->with('error', _lang('Update Failed !'));
         }else{
            return response()->json(['result'=>'error','message'=>_lang('Update Failed !')]);
         }
    }


    if(! $request->ajax()){
       return redirect('/carusel')->with('success', _lang('Carusel Updated Sucessfully'));
    }else{
       return response()->json(['result'=>'success','action'=>'update', 'message'=>_lang(' Carusel Updated Sucessfully'),'data'=>$item]);
    }

}


public function destroycarusel($id)
{
    $carusel =Carousel::find($id);


    // Check if the post exists
    if ($carusel) {
        // Delete the post
        $carusel->delete();

        // Optionally, you may want to add a success message
        return redirect('/carusel')->with('success', 'Carusel Information has been deleted sucessfully.');
    }

    // If the post doesn't exist, redirect with an error message
    return redirect('/carusel')->with('error', 'Carusel not found.');
    // return redirect('/services')->with('success',_lang('Information has been deleted sucessfully'));
}



public function gallery(){
    $data=array();
    $data['gallery'] = Gallery::all();
    return view('theme.default.template.galler',$data);
}

}



