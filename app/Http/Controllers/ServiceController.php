<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Service;
use App\Item;
use App\Notice;
use Validator;
use Illuminate\Validation\Rule;
use App\Imports\ServicesImport;
use Maatwebsite\Excel\Facades\Excel;
use DB;

class ServiceController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    // public function create(Request $request)
    // {
	// 	if( ! $request->ajax()){
	// 	   return view('backend.accounting.service.create');
	// 	}else{
    //        return view('backend.accounting.service.modal.create');
	// 	}
    // }

    /** Excel Import**/
    // public function import(Request $request)
    // {
    //     if($request->isMethod('get')){
    //         return view('backend.accounting.service.import');
    //     }else{
    //         @ini_set('max_execution_time', 0);
    //         @set_time_limit(0);

    //         $validator = Validator::make($request->all(), [
    //             'file' => 'required|mimes:xlsx',
    //         ]);

    //         if ($validator->fails()) {
    //             if($request->ajax()){
    //                 return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
    //             }else{
    //                 return redirect('services/import')->withErrors($validator)
    //                                                   ->withInput();
    //             }
    //         }

    //         $new_rows = 0;

    //         DB::beginTransaction();

    //         $previous_rows = Item::where('company_id',company_id())->count();

    //         $import = Excel::import(new ServicesImport, request()->file('file'));

    //         $current_rows = Item::where('company_id',company_id())->count();

    //         $new_rows = $current_rows - $previous_rows;

    //         DB::commit();

    //         return back()->with('success',$new_rows.' '._lang('Rows Imported Sucessfully'));
    //     }

    // }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
//     public function store(Request $request)
//     {
// 		$validator = Validator::make($request->all(), [
// 			'item_name' => 'required',
//             'cost' => 'required|numeric',
// 		]);

// 		if ($validator->fails()) {
// 			if($request->ajax()){
// 			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
// 			}else{
// 				return redirect('services/create')
// 							->withErrors($validator)
// 							->withInput();
// 			}
// 		}

//         DB::beginTransaction();

//         //Create Item
//         $item = new Item();
//         $item->item_name = $request->input('item_name');
//         $item->item_type = 'service';
//         $item->company_id = company_id();
//         $item->save();


// 	    //Create Product
//         $service = new Service();
// 	    $service->item_id = $item->id;
//         $service->cost = $request->input('cost');
//         $service->tax_method = 'exclusive';
//         //$service->tax_id = $request->input('tax_id');
//         $service->description = $request->input('description');

//         $service->save();

// 		DB::commit();

// 		if(! $request->ajax()){
//            return redirect('services/create')->with('success', _lang('Saved Sucessfully'));
//         }else{
// 		   return response()->json(['result'=>'success','action'=>'store','message'=>_lang('Saved Sucessfully'),'data'=> $item]);
// 		}

//    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // public function show(Request $request,$id)
    // {
    //     $item = Item::where("id",$id)->where("company_id",company_id())->first();

	// 	if(! $request->ajax()){
	// 	    return view('backend.accounting.service.view',compact('item','id'));
	// 	}else{
	// 		return view('backend.accounting.service.modal.view',compact('item','id'));
	// 	}

    // }





    public function service()
    {
        $items = Item::all();
        return view('theme.default.theme_option.list',compact('items'));
    }
    /**
     * Show the form for editing the specified resource.
     *
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function editService($id)
    {
        $item = Item::find($id);
        return view('theme.default.theme_option.edit',compact('item'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateservices(Request $request, $id)
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
            $file->move(public_path()."/uploads/service/", $img);
        }
        //Update item
		DB::beginTransaction();
        $item =Item::find($id);

        if( $item ){

            $item->name = $request->input('name');
            $item->description = $request->input('description');
            if($request->hasfile('img')){
                $item->img = $img;
            }
            // $item->company_id = company_id();
            $item->save();


            // $service = Service::where("item_id",$id)->first();
            // $service->item_id = $item->id;
            // $service->cost = $request->input('cost');
            // $service->tax_method = 'exclusive';
            // //$service->tax_id = $request->input('tax_id');
            // $service->description = $request->input('description');

            // $service->save();
			DB::commit();
        }else{
            if(! $request->ajax()){
                return redirect('/service')->with('error', _lang('Update Failed !'));
             }else{
                return response()->json(['result'=>'error','message'=>_lang('Update Failed !')]);
             }
        }


		if(! $request->ajax()){
           return redirect('/service')->with('success', _lang('Services Updated Sucessfully'));
        }else{
		   return response()->json(['result'=>'success','action'=>'update', 'message'=>_lang(' Services Updated Sucessfully'),'data'=>$item]);
		}

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroyservices($id)
    {
        $services = Item::find($id);

        // Check if the post exists
        if ($services) {
            // Delete the post
            $services->delete();

            // Optionally, you may want to add a success message
            return redirect('/service')->with('success', 'Services Information has been deleted sucessfully.');
        }

        // If the post doesn't exist, redirect with an error message
        return redirect('/service')->with('error', 'Services not found.');
        // return redirect('/services')->with('success',_lang('Information has been deleted sucessfully'));
    }

    public function notice()
    {
        // dd('notice');
        $items = Notice::where("company_id",company_id())
                    ->orderBy("id","desc")->get();
        return view('backend.accounting.notice.list',compact('items'));
    }

    public function noticeCreate(Request $request)
    {

        return view('backend.accounting.notice.modal.create');

    }

    public function noticeSave(Request $request)
    {
        // dd($request->all());
		$validator = Validator::make($request->all(), [
			'title' => 'required',
            'body' => 'required',
		]);

		if ($validator->fails()) {
			if($request->ajax()){
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return redirect('notices/create')
							->withErrors($validator)
							->withInput();
			}
		}

        DB::beginTransaction();

        //Create Item
        $item = new Notice();
        $item->title = $request->input('title');
        $item->body = $request->input('body');
        $item->company_id = company_id();
        $item->save();

		DB::commit();


		return response()->json(['result'=>'success','action'=>'store','message'=>_lang('Saved Sucessfully'),'data'=> $item]);


   }

   public function showNotice(Request $request,$id)
   {
       $item = Notice::where("id",$id)->where("company_id",company_id())->first();


           return view('backend.accounting.notice.modal.view',compact('item','id'));


   }

   /**
    * Show the form for editing the specified resource.
    *
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
   public function editNotice($id)
   {
       $item = Notice::where("id",$id)->where("company_id",company_id())->first();


          return view('backend.accounting.notice.modal.edit',compact('item','id'));


   }

   /**
    * Update the specified resource in storage.
    *
    * @param  \Illuminate\Http\Request  $request
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
   public function updateNotice(Request $request, $id)
   {
    //    dd($request->all());
       $validator = Validator::make($request->all(), [
           'title' => 'required',
           'body' => 'required',
       ]);

       if ($validator->fails()) {
           if($request->ajax()){
               return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
           }else{
               return redirect()->route('notices.edit', $id)
                           ->withErrors($validator)
                           ->withInput();
           }
       }

       //Update item
       DB::beginTransaction();
       $item = Notice::where("id",$id)->where("company_id",company_id())->first();

       if( $item ){

           $item->title = $request->input('title');
           $item->body = $request->input('body');
           $item->company_id = company_id();
           $item->status= ($request->status=="on") ? 1 : 0 ;
           $item->update();

           DB::commit();
       }else{
           if(! $request->ajax()){
               return redirect('notices')->with('error', _lang('Update Failed !'));
            }else{
               return response()->json(['result'=>'error','message'=>_lang('Update Failed !')]);
            }
       }


       if(! $request->ajax()){
          return redirect('notices')->with('success', _lang('Updated Sucessfully'));
       }else{
          return response()->json(['result'=>'success','action'=>'update', 'message'=>_lang('Updated Sucessfully'),'data'=>$item]);
       }

   }

   /**
    * Remove the specified resource from storage.
    *
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
   public function destroyNotice($id)
   {
       DB::beginTransaction();
       $item = Notice::where("id",$id)->where("company_id",company_id());
       $item->delete();

       DB::commit();
       return redirect('notices')->with('success',_lang('Information has been deleted sucessfully'));
   }
}
