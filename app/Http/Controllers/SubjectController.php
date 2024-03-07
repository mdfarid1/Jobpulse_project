<?php

namespace App\Http\Controllers;

use App\Models\Subject;
use Illuminate\Http\Request;
use App\User;
use App\InstituteClass;
use App\Models\SubjectTeacher;
use Validator;
use DataTables;
use Auth;
use DB;
use Notification;

class SubjectController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data=array();
        $data['teachers'] = User::where("users.company_id",company_id())
         ->where("users.role_id",5)
         ->get();

        return view('backend.accounting.subject.list',$data);
    }


    public function get_table_data(Request $request){
        $company_id = company_id();
        $user_type = Auth::user()->user_type;

        $subjects = Subject::select('subjects.*')
                               ->where('company_id',$company_id)
                               ->when($user_type, function ($query, $user_type) {
                                    if($user_type == 'staff'){
                                       return $query->join('subject_teachers','subjects.id','subject_teachers.subject_id');
                                    }
                                })
                                ->orderBy("subjects.id","desc");


        return Datatables::eloquent($subjects)
                            ->filter(function ($query) use ($request) {
                                if ($request->has('staff_id')) {
                                    $query->where('teacher', 'like', "%{$request->post('staff_id')}%");
                                }

                                // if ($request->has('status')) {
                                //     $query->whereIn('status', json_decode($request->post('status')));
                                // }

                            })



                            ->editColumn('name', function ($subject) {
                                return '<a href="'.action('SubjectController@show', $subject['id']).'">'. $subject->name .'</a>';
                            })
                            ->editColumn('name', function ($subject) {
                                return $subject->name;
                            })
                            ->editColumn('class_id', function ($subject) {
                                return $subject->classes->class_name;
                            })

                            ->editColumn('start_time', function ($subject) {
                                return date('g:i A', strtotime($subject->start_time));
                            })
                            ->editColumn('end_time', function ($subject) {
                                return date('g:i A', strtotime($subject->end_time));
                            })
                            ->editColumn('teacher', function ($subject) {
                                return teacher_name($subject->teacher);
                            })


                            ->addColumn('action', function ($subject) {
                                return '<form action="'.action('SubjectController@destroy', $subject['id']).'" class="text-center" method="post">'
                                .'<a href="'.action('SubjectController@show', $subject['id']).'" class="btn btn-primary btn-xs"><i class="ti-eye"></i></a>&nbsp;'
                                .'<a href="'.action('SubjectController@edit', $subject['id']).'" data-title="'. _lang('Update Project') .'" class="btn btn-warning btn-xs ajax-modal"><i class="ti-pencil"></i></a>&nbsp;'
                                .csrf_field()
                                .'<input name="_method" type="hidden" value="DELETE">'
                                .'<button class="btn btn-danger btn-xs btn-remove" type="submit"><i class="ti-eraser"></i></button>'
                                .'</form>';
                            })
                            ->setRowId(function ($subject) {
                              return "row_".$subject->id;
                            })
                            ->rawColumns(['action','name'])
                            ->make(true);
        }
    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $data['teachers'] = User::where("users.company_id",company_id())
         ->where("users.user_type","staff")
         ->get();
         $data['classes']=InstituteClass::leftjoin('contact_groups','institute_classes.group_id','=','contact_groups.id')
         ->select('institute_classes.id','institute_classes.class_name','contact_groups.name')
         ->where('institute_classes.company_id',company_id())
         ->get();
        if( ! $request->ajax()){
            return view('backend.accounting.subject.create',$data);
         }else{
            return view('backend.accounting.subject.modal.create',$data);
         }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            // 'client_id' => 'required',
            // 'billing_type' => 'required',
            // 'status' => 'required',
            // 'fixed_rate' => 'required_if:billing_type,fixed',
            // 'hourly_rate' => 'required_if:billing_type,hourly',
            // 'start_date' => 'required',
        ]);

        if ($validator->fails()) {
            if($request->ajax()){
                return response()->json(['result' => 'error', 'message' => $validator->errors()->all()]);
            }else{
                return redirect()->route('projects.create')
                               ->withErrors($validator)
                               ->withInput();
            }
        }

        $other = Subject::where('teacher',$request->teacher)
                          ->where('name',$request->name)
		                  ->where('class_id',$request->classes)
                          ->where('company_id',company_id())
                          ->first();

        if( $other ){
        	if($request->ajax()){
			    return response()->json(['result'=>'error','message'=>'Sorry, This subject already added in this class !']);
			}else{
				return redirect('contacts/create')->with('error', _lang('Sorry, This subject already added in this class !'))->withInput();
			}
        }

        DB::beginTransaction();

        $subject = new Subject();
        $subject->name = $request->input('name');
        $subject->teacher = $request->input('teacher');
        $subject->class_id = $request->input('classes');
        $subject->start_time = $request->input('start_time');
        $subject->end_time = $request->input('end_time');
        $subject->company_id = company_id();
        $subject->save();

        // create_log('projects', $subject->id, _lang('Created Project'));


        //Store Project Members
        if(isset($request->classes)){

            $project_member  = new SubjectTeacher();
            $project_member->subject_id = $subject->id;
            $project_member->class_id = $request->classes;
            $project_member->teacher_id = $subject->teacher;
            $project_member->save();

                // create_log('projects', $subject->id, _lang('Assign to').' '.$project_member->user->name);

        }


        // if($project->client->user->id != null){
        //    Notification::send($project->client->user, new ProjectCreated($project));
        // }
        // Notification::send($project->members, new ProjectCreated($project));

        DB::commit();


        if(! $request->ajax()){
           return redirect()->route('subjects.create')->with('success', _lang('Saved Sucessfully'));
        }else{
           return response()->json(['result'=>'success','action'=>'store','message'=>_lang('Saved Sucessfully'), 'data'=>$subject, 'table' => '#projects_table']);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $company_id = company_id();
        // $user_type = Auth::user()->user_type;
        $data = array();

        $data['subject'] = Subject::leftjoin('subject_teachers','subjects.id','subject_teachers.subject_id')
                                  ->where('subjects.id', $id)
                                  ->where('company_id', $company_id)
                                  ->first();
		if(! $data['subject']){
			return back()->with('error', _lang('Sorry, Subject not found !'));
		}

        //get Summary data
        // $data['hour_completed'] = \App\TimeSheet::where('project_id',$id)
        //                                               ->selectRaw("SUM( TIMESTAMPDIFF(SECOND, start_time, end_time) ) as total_seconds")
        //                                               ->where('company_id', $company_id)
        //                                               ->first();


        // $data['invoices'] = \App\Invoice::where('related_to','projects')
        //                                 ->where('related_id', $id)
        //                                 ->where('company_id', $company_id)
        //                                 ->get();

        // $data['expenses'] = \App\Transaction::where("transactions.company_id",$company_id)
        //                                     ->where("project_id",$id)
        //                                     ->orderBy("transactions.id","desc")
        //                                     ->get();

        // $data['tasks'] = \App\Task::where('project_id',$id)
        //                           ->where('company_id', $company_id)
        //                           ->when($user_type, function ($query, $user_type) {
        //                                 if($user_type == 'staff'){
        //                                    return $query->where('assigned_user_id',Auth::id());
        //                                 }
        //                             })
        //                           ->get();

        // $data['timesheets'] = \App\TimeSheet::where('project_id',$id)
        //                                     ->where('company_id', $company_id)
        //                                     ->orderBy('id','desc')
        //                                     ->get();

        // $data['project_milestones']  = \App\ProjectMilestone::where('project_id',$id)
        //                                                     ->where('company_id',$company_id)
        //                                                     ->orderBy('id','desc')
        //                                                     ->get();


        $data['projectfiles'] = \App\ProjectFile::where('related_id', $id)
                                                ->where('related_to', 'projects')
                                                ->where('company_id', $company_id)
                                                ->orderBy('id','desc')
                                                ->get();

        $data['notes'] = \App\Note::where('related_id', $id)
                                  ->where('related_to', 'projects')
                                  ->where('company_id', $company_id)
                                  ->orderBy('id','desc')
                                  ->get();

        return view('backend.accounting.subject.view', $data);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request,$id)
    {
        $subject = Subject::where('id',$id)
                          ->where('company_id',company_id())
                          ->first();
        // dd($subject);
        $data['teachers'] = User::where("users.company_id",company_id())
                          ->where("users.role_id",5)
                          ->get();
        $data['classes']=  InstituteClass::leftjoin('contact_groups','institute_classes.group_id','=','contact_groups.id')
                          ->select('institute_classes.id','institute_classes.class_name','contact_groups.name')
                          ->where('institute_classes.company_id',company_id())
                          ->get();
        if(! $request->ajax()){
            return view('backend.accounting.project.edit',compact('project','id'));
        }else{
            return view('backend.accounting.subject.modal.edit',compact('subject','id'),$data);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Subject $subject)
    {
        //

        // dd($request->all());

        DB::beginTransaction();

        $subject = Subject::where('id',$request->id)
                            ->where('company_id',company_id())
                            ->first();
        $subject->name = $request->input('name');
        $subject->teacher = $request->input('teacher');
        $subject->class_id = $request->input('classes');
        $subject->start_time = $request->input('start_time');
        $subject->end_time = $request->input('end_time');
        $subject->company_id = company_id();
        $subject->save();

        // // create_log('projects', $subject->id, _lang('Created Project'));


        // //Store Project Members
        if(isset($request->classes)){

            $project_member  = new SubjectTeacher();
            $project_member->subject_id = $subject->id;
            $project_member->class_id = $request->classes;
            $project_member->teacher_id = $subject->teacher;
            $project_member->save();

                // create_log('projects', $subject->id, _lang('Assign to').' '.$project_member->user->name);

        }




        DB::commit();


        if(! $request->ajax()){
           return redirect()->route('subjects.create')->with('success', _lang('Updated Sucessfully'));
        }else{
           return response()->json(['result'=>'success','action'=>'store','message'=>_lang('Updated Sucessfully'), 'data'=>$subject, 'table' => '#projects_table']);
        }

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        DB::beginTransaction();
        $company_id = company_id();
        $subject = Subject::where('id',$id)
                    ->where('company_id',$company_id)->first();

        $subject_classes=SubjectTeacher::where('subject_id',$subject['id'])->delete();
        $subject->delete();

        DB::commit();
        return redirect()->route('subjects.index')->with('success',_lang('Deleted Sucessfully'));
    }

    public function get_teacher_info( $id = '' ){
        $staff = User::with('staff')
                        ->where("id",$id)
                        ->where("company_id",company_id())->first();
        echo json_encode($staff);
  }
}
