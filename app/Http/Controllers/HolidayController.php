<?php

namespace App\Http\Controllers;

use App\Holiday;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Illuminate\Validation\Rule;
use Carbon\Carbon;

class HolidayController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $holidays = Holiday::where("company_id",company_id())
        ->orderBy("start_date","asc")->get();
        // return view('backend.accounting.holiday.calendar',compact('holidays'));
        return view('backend.accounting.holiday.list',compact('holidays'));
    }

    public function calendar()
    {
        $holidays = Holiday::where("company_id",company_id())
        ->orderBy("id","desc")->get();
        return view('backend.accounting.holiday.calendar',compact('holidays'));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        if( ! $request->ajax()){
            return view('backend.accounting.holiday.create');
         }else{
            return view('backend.accounting.holiday.modal.create');
         }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
			'title' => 'required|max:191',
			'start_date' => 'required',
		]);

		if ($validator->fails()) {
			if($request->ajax()){
			    return response()->json(['result'=>'error','message'=>$validator->errors()->all()]);
			}else{
				return redirect('holidays/create')
							->withErrors($validator)
							->withInput();
			}
		}


        $startDate = new Carbon($request->start_date);
        $endDate = new Carbon($request->end_date);
        $all_dates = array();
        while ($startDate->lte($endDate)){
          $all_dates[] = $startDate->toDateString();

          $startDate->addDay();
        }
        // dd($all_dates);
        if(isset($request->start_date)){
            foreach($all_dates as $holdate){
                $holiday= new Holiday();
                $holiday->title = $request->input('title');
                $holiday->start_date = $holdate;
                $holiday->end_date = $request->input('end_date');
                $holiday->company_id = company_id();
                // dd($holiday);
                $holiday->save();

            }
        }




		//Set Related Data

		if(! $request->ajax()){
           return redirect('holidays')->with('success', _lang('Saved Sucessfully'));
        }else{
		   return response()->json(['result'=>'success','action'=>'store','message'=>_lang('Saved Sucessfully'),'data'=>$account]);
		}
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Holiday  $holiday
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request,$id)
    {
        $transaction = Holiday::where("id",$id)->where("company_id",company_id())->first();
        // dd($transaction);
        return view('backend.accounting.holiday.modal.view',compact('transaction','id'));


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Holiday  $holiday
     * @return \Illuminate\Http\Response
     */
    public function edit(Holiday $holiday)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Holiday  $holiday
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Holiday $holiday)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Holiday  $holiday
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $holiday = Holiday::where("id",$id)->where("company_id",company_id());
        $holiday->delete();
        return redirect()->route('holidays.index')->with('success',_lang('Removed Sucessfully'));
    }
}
