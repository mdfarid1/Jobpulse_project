<?php

namespace App\Http\Controllers;

use App\Models\Gallery;
use Illuminate\Http\Request;

class GalleryController extends Controller
{
    public function gallery(){
        $data=array();
        $data['gallery']=Gallery::all();
         return view('theme.default.theme_option.gallery',$data);
     }
     public function galleryCreate(){

        return view('theme.default.theme_option.gallerycreate');
    }



     public function galleryStore(REQUEST $request){
        // dd($request->all());
        $request->validate([
            'title' => 'max:225',
            'gallery_img' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',

        ]);
        $file = $request->file('gallery_img');
        $gallery_img = "gallery_img".time().'.'.$file->getClientOriginalExtension();
        $file->move(public_path()."/uploads/gallery/", $gallery_img);

        // $imagePath = $request->file('image')->store('blog_images', 'public');

        $gallery = new Gallery;
        $gallery->title = $request->title;
        $gallery->gallery_img = $gallery_img;
        $gallery->save();

        return redirect('/gallery/list')->with('success', 'Gallery post created successfully!');
    }


    public function editgallery($id){
        $data=array();
        $data['gallery']=Gallery::find($id);
        // dd($data);
      return view('theme.default.theme_option.galleryedit',$data);
     }


     public function updategallery(REQUEST $request,$id){
        // dd($request->all());
        $request->validate([
            'title' => 'max:225',
            'gallery_img' => 'image|mimes:jpeg,png,jpg,gif|max:2048',

        ]);
        if($request->hasfile('blog_img'))
        {
            $file = $request->file('gallery_img');
            $gallery_img = "gallery_img".time().'.'.$file->getClientOriginalExtension();
            $file->move(public_path()."/uploads/gallery/", $gallery_img);
        }

        $gallery = Gallery::find($id);
        $gallery->title = $request->title;
        if($request->hasfile('blog_img')){
            $gallery->gallery_img = $gallery_img;
        }
        // $gallery->gallery_img = $gallery_img;
        $gallery->save();

        return redirect('gallery')->with('success', 'Gallery Update  successfully!');
    }





    public function destroygallery(Request $request, $id)
 {
     // Find the blog post by ID
     $gallery = Gallery::find($id);

     // Check if the post exists
     if ($gallery) {
         // Delete the post
         $gallery->delete();

         // Optionally, you may want to add a success message
         return redirect('gallery/create')->with('success', 'Gallery deleted successfully.');
     }

     // If the post doesn't exist, redirect with an error message
     return redirect('/gallery/list')->with('error', 'Gallery not found.');
 }


        //   $validator = Validator::make($request->all(), [
        //     'title' => 'required|max:150',
        //     'description' => 'required|min:500',
        //     'fblink' => 'required|min:50',
        //     'gglink' => 'required|min:50',

        // ]);

        // if ($validator->fails()) {

        //         return redirect()->back()
        //                     ->withErrors($validator)
        //                     ->withInput();

        // }


    //     $file = $request->file('blog_img');
    //     $blog_img = "blog_img".time().'.'.$file->getClientOriginalExtension();
    //     $file->move(public_path()."/uploads/blogs/", $blog_img);


    //   $blog = new Blog();
    //   $blog->title = $request->title;
    //   $blog->description = $request->description;
    //   $blog->blog_img = $blog_img;
    //   $blog->social_link_fb	 = $request->fblink;
    //   $blog->social_link_gg = $request->gglink;
    //   $blog->save();
    //   return redirect('/blog')->with('success', _lang('Saved Sucessfully'));
    // }


     //category page
    //  public function post(){
    //      $data=array();
    //      $data['posts']= Blog::orderBy('id','desc')->with('user')->paginate(9);
    //      // dd($data);
    //      return view('theme.default.template.blog',$data);
    //  }

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
    //  public function postshow(){
    //      $data=array();
    //      $data['posts']= Blog::orderBy('id','desc')->with('user')->paginate(10);
    //      return view('theme.default.theme_option.blog_show',$data);
    //  }

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



    //  blog add validation

     //blog edit validation


      //blog update validation
//      public function blogupdate(REQUEST $request,$id){
//          $validator = Validator::make($request->all(), [
//          //   'category_id' => 'required',
//            'title' => 'required',
//            'description' => 'required',
//    ]);

//    if ($validator->fails()) {

//        return redirect()->back()
//              ->withErrors($validator)
//              ->withInput();

//    }

//          if($request->hasfile('blog_img'))
//          {
//              $file = $request->file('blog_img');
//              $blog_img = "blog_img".time().'.'.$file->getClientOriginalExtension();
//              $file->move(public_path()."/uploads/blog/", $blog_img);
//          }



//      $blog = Blog::find($id);
//      // $blog->category_id = $request->category_id;
//      $blog->title = $request->title;
//      // $blog->slug=SlugService::createSlug(Blog::class, 'slug', $request->title);
//      $blog->description = $request->description;
//      $blog->status = $request->status;
//      if($request->hasfile('blog_img')){
//          $blog->blog_img = $blog_img;
//      }


//      $blog->social_link_fb	 = $request->facebook_link;
//      $blog->social_link_gg = $request->google_link;
//      $blog->save();
//      return redirect('post/show')->with('success', _lang('Post Update Sucessfully'));
//    }





//    public function deletePost(Request $request, $id)
//  {
//      // Find the blog post by ID
//      $post = Blog::find($id);

//      // Check if the post exists
//      if ($post) {
//          // Delete the post
//          $post->delete();

//          // Optionally, you may want to add a success message
//          return redirect('/post/show')->with('success', 'Blog post deleted successfully.');
//      }

//      // If the post doesn't exist, redirect with an error message
//      return redirect('/post/show')->with('error', 'Blog post not found.');
//  }



}
