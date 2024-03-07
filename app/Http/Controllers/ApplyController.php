<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use App\Blog;
use App\Models\Apply;
use Illuminate\Http\Request;

class ApplyController extends Controller
{
    public function apply($id)
    {
        $data=array();
        $data['blog']=Blog::find($id);
        return view('backend.apply.create',$data);
    }

    public function applyList()
    {
        $data=array();
        $data['applies'] = Apply::with('user', 'blog')->get();
        // dd($data);
        return view('backend.apply.list',$data);
    }




    public function deleteapply(Request $request, $id)
{
    // Find the blog post by ID
    $apply = Apply::find($id);

    // Check if the post exists
    if ($apply) {
        // Delete the post
        $apply->delete();

        // Optionally, you may want to add a success message
        return redirect('admin/dashboard')->with('success', 'Apply deleted successfully.');
    }

    // If the post doesn't exist, redirect with an error message
    return redirect('admin/dashboard')->with('error', 'Apply not found.');
}



    public function applystore(Request $request,$job_id)
    {
        // dd($request->all());
        $this->validate($request, [
            'name' => 'required',
            'email' => 'email',
            'phone' => 'nullable|string',
            'dob' => 'nullable|date',
            'bio' => 'nullable|string|max:250',
            'cv' => 'required|file|mimes:pdf,doc,docx|max:5000', // Adjust mime types and max file size as needed
        ]);

        $existingApplication = Apply::where('email', $request->email)->exists();
        if ($existingApplication) {
            return redirect()->back()->with('error', 'An application with this email address already exists.');
        }

        $apply = new Apply();
        $apply->name = $request->name;
        if (Auth::user()->email==$request->email) {
            $apply->email = $request->email;
        }else{
            $apply->email = Auth::user()->email;
        }
        $apply->phone = $request->phone;
        $apply->dob = $request->dob;
        $apply->bio = $request->bio;
        $apply->company_id = $request->company_id;

        $apply->user_id = $job_id;
        $apply->blog_id = $request->blog_id;
        if ($request->hasFile('cv')) {
            $cvFile = $request->file('cv');
            $cvFileName = "cv_" . time() . '.' . $cvFile->getClientOriginalExtension();
            $cvFile->move(public_path('uploads/apply'), $cvFileName);
            $apply->cv = $cvFileName;
        }
        $apply->save();
        return redirect('admin/dashboard')->with('success', 'Application sent successfully!');
    }


    public function update(Request $request, Apply $apply)
{
    $request->validate([
        'status' => 'in:approved', // Add any other validation rules as needed
    ]);

    $apply->update([
        'status' => $request->status,
    ]);

    return redirect()->back()->with('success', 'Status updated successfully.');
}

}
