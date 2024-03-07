<?php

namespace App\Http\Controllers;

use App\Models\Circular;
use Illuminate\Http\Request;

class CircularController extends Controller
{
    public function jobCircularShow(){
        $data=array();
        $data['Circular']=Circular::orderBy('id','desc')->paginate(18);
         return view('theme.default.template.circular',$data);
     }
     public function jobCircularView($id){
        $data=array();
        $data['Circular']=Circular::find($id);
         return view('theme.default.template.jobCircularView',$data);
     }



    public function jobCircular(){
        $data=array();
        $data['Circular']=Circular::all();
         return view('theme.default.theme_option.jobcircular',$data);
     }
     public function jobCircularCreate(){

        return view('theme.default.theme_option.jobcircularCreate');
    }



     public function jobCircularStore(REQUEST $request){
        // dd($request->all());
        $request->validate([
            'title' => 'required|max:225',
            'description' => 'required',
            'img' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:5120',

        ]);
        if($request->hasfile('img'))
    {
        $file = $request->file('img');
        $img = "img".time().'.'.$file->getClientOriginalExtension();
        $file->move(public_path()."/uploads/jobcircular/", $img);
    }
        // $file = $request->file('img');
        // $img = "img".time().'.'.$file->getClientOriginalExtension();
        // $file->move(public_path()."/uploads/govornor/", $img);

        // $imagePath = $request->file('image')->store('blog_images', 'public');

        $Circular = new Circular;
        $Circular->title = $request->title;
        $Circular->description = $request->description;
        if($request->hasfile('img')){
            $Circular->img =$img;
        }
        $Circular->save();

        return redirect('/blog/list')->with('success', 'Blog created successfully!');
    }


    public function editjobCircular($id){
        $data=array();
        $data['Circular']=Circular::find($id);
        // dd($data);
      return view('theme.default.theme_option.jobcircularEdit',$data);
     }


     public function updatejobCircular(REQUEST $request,$id){
        // dd($request->all());
        $request->validate([
            'title' => 'max:225',
            'description' => '',
            'img' => 'image|mimes:jpeg,png,jpg,gif|max:2048',

        ]);
        if($request->hasfile('img'))
        {
            $file = $request->file('img');
            $img = "img".time().'.'.$file->getClientOriginalExtension();
            $file->move(public_path()."/uploads/jobcircular/", $img);
        }

        $Circular = Circular::find($id);
        $Circular->title = $request->title;
        $Circular->description = $request->description;
        if($request->hasfile('img')){
            $Circular->img = $img;
        }
        // $gallery->gallery_img = $gallery_img;
        $Circular->save();

        return redirect('/blog/list')->with('success', 'Blog Update  successfully!');
    }





    public function destroyjobCircular(Request $request, $id)
 {
     // Find the blog post by ID
     $Circular = Circular::find($id);

     // Check if the post exists
     if ($Circular) {
         // Delete the post
         $Circular->delete();

         // Optionally, you may want to add a success message
         return redirect('blog/create')->with('success', 'Blog deleted successfully.');
     }

     // If the post doesn't exist, redirect with an error message
     return redirect('/blog/list')->with('error', 'Blog not found.');
 }
}
