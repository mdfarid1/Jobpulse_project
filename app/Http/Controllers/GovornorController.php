<?php

namespace App\Http\Controllers;

use App\Models\Govornor;
use Illuminate\Http\Request;

class GovornorController extends Controller
{

    public function governor(){
        $data=array();
        $data['governor']=Govornor::all();
         return view('theme.default.template.governor',$data);
     }



    public function governing(){
        $data=array();
        $data['Govornor']=Govornor::all();
         return view('theme.default.theme_option.governingBody',$data);
     }
     public function governingCreate(){

        return view('theme.default.theme_option.goverCreate');
    }



     public function governingStore(REQUEST $request){
        // dd($request->all());
        $request->validate([
            'name' => 'required|max:225',
            'title' => 'required|max:225',
            'img' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:5120',

        ]);
        if($request->hasfile('img'))
    {
        $file = $request->file('img');
        $img = "img".time().'.'.$file->getClientOriginalExtension();
        $file->move(public_path()."/uploads/govornor/", $img);
    }
        // $file = $request->file('img');
        // $img = "img".time().'.'.$file->getClientOriginalExtension();
        // $file->move(public_path()."/uploads/govornor/", $img);

        // $imagePath = $request->file('image')->store('blog_images', 'public');

        $Govornor = new Govornor;
        $Govornor->name = $request->name;
        $Govornor->title = $request->title;
        if($request->hasfile('img')){
            $Govornor->img ='default.png';
        }
        $Govornor->save();

        return redirect('/governing/list')->with('success', 'Director created successfully!');
    }


    public function editGoverning($id){
        $data=array();
        $data['Govornor']=Govornor::find($id);
        // dd($data);
      return view('theme.default.theme_option.goverEdit',$data);
     }


     public function updateGoverning(REQUEST $request,$id){
        // dd($request->all());
        $request->validate([
            'name' => 'max:225',
            'title' => 'max:225',
            'img' => 'image|mimes:jpeg,png,jpg,gif|max:2048',

        ]);
        if($request->hasfile('img'))
        {
            $file = $request->file('img');
            $img = "img".time().'.'.$file->getClientOriginalExtension();
            $file->move(public_path()."/uploads/govornor/", $img);
        }

        $Govornor = Govornor::find($id);
        $Govornor->title = $request->title;
        if($request->hasfile('img')){
            $Govornor->img = $img;
        }
        // $gallery->gallery_img = $gallery_img;
        $Govornor->save();

        return redirect('/governing/list')->with('success', 'Director Update  successfully!');
    }





    public function destroyGoverning(Request $request, $id)
 {
     // Find the blog post by ID
     $Govornor = Govornor::find($id);

     // Check if the post exists
     if ($Govornor) {
         // Delete the post
         $Govornor->delete();

         // Optionally, you may want to add a success message
         return redirect('governing/create')->with('success', 'Director deleted successfully.');
     }

     // If the post doesn't exist, redirect with an error message
     return redirect('/governing/list')->with('error', 'Director not found.');
 }
}
