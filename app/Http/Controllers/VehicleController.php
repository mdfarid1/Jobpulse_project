<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Contact;
use Validator;
use Auth;
use App\User;
use App\Invoice;
use App\Quotation;
use App\Transaction;
use App\VehicleType;
use App\Company;
use App\Vehicle;
use App\Driver;
use Hash;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Mail;
use App\Notifications\ContactAccount as ContactAccountNotification;
use App\Mail\GeneralMail;
use App\Utilities\Overrider;
use App\Imports\ContactsImport;
use Maatwebsite\Excel\Facades\Excel;
use DataTables;
use DB;
use Response;

class VehicleController extends Controller
{
    //  public function __construct()
    // {
    //     date_default_timezone_set(get_company_option('timezone',get_option('timezone','Asia/Dhaka')));
        
    //     $this->middleware(function ($request, $next) {
    //         if( has_membership_system() == 'enabled' ){
    //             if( ! has_feature( 'vehicles_limit' ) ){
    //                 return redirect('membership/extend')->with('message',_lang('Your Current package not support this feature. You can upgrade your package !'));
    //             }

    //         //    If request is create/store
    //             $route_name = \Request::route()->getName();
    //             if( $route_name == 'vehicle.type'){
    //                   if( ! $request->ajax()){
    //                       return redirect('membership/extend')->with('message', _lang('Your have already reached your usages limit. You can upgrade your package !'));
    //                   }else{
    //                       return response()->json(['result'=>'error','message'=> _lang('Your have already reached your usages limit. You can upgrade your package !') ]);
    //                   }
    //                }
    //         }

    //         return $next($request);
    //     });
    // }

/************ Vehicle Types ************/ 
     public function vehicle_type_view()
    {
        $data = array();
        return view('backend.vehicle.vehicle_type_list',$data);
    }

    public function listVehiclesType(Request $request){
        
       $columns = array(0 =>'type_name',1 =>'seats',2=> 'status',3=> 'action');
        $totalData = VehicleType::where("vehicle_types.company_id",company_id())->count();
        $limit = $request->input('length');$start = $request->input('start');
        $order = $columns[$request->input('order.0.column')]; $dir = $request->input('order.0.dir');
        if(empty($request->input('search.value')))
        {
            $posts = VehicleType::where("vehicle_types.company_id",company_id())->offset($start)->limit($limit)->orderBy("vehicle_types.id","desc")->get();
            $totalFiltered =  VehicleType::where("vehicle_types.company_id",company_id())->count();
        }
        else{
            $search = $request->input('search.value');
            $posts = VehicleType::where("vehicle_types.company_id",company_id())
                    ->orwhere('type_name', 'like', "%{$search}%")
                    ->offset($start)->limit($limit)
                    ->orderBy("vehicle_types.id","desc")->get();
            $totalFiltered = VehicleType::where("vehicle_types.company_id",company_id())
                    ->orwhere('type_name', 'like', "%{$search}%")
                    ->count();
        }
        $data = array();

    if($posts){
        foreach($posts as $r)
        {     
            
            $nestedData['type_name'] = $r->type_name;
            $nestedData['seats'] = $r->seats;
            
           if( $r->status==0){
                $status = '<div class="btn-group"><div class="badge badge-warning dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true" style="color:#f1f5fa"><span>Hide</span></a>
                <div class="dropdown-menu" x-placement="top-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(4px, -165px, 0px);">
                    <a class="dropdown-item csts" data-id="'.$r->id.'" data-sts="1" href="#" style="">Show</a></div>
                </div>
                 </div>';
            }else{
                $status = '<div class="btn-group"><div class="badge badge-success dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true" style="color:#f1f5fa"><span>Show</span></a>
                <div class="dropdown-menu" x-placement="top-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(4px, -165px, 0px);">
                    <a class="dropdown-item csts" style="" data-id="'.$r->id.'" data-sts="0" href="#">Hide</a></div>
                </div>
                </div>';
            }
            $nestedData['sts']=$status;
            // $nestedData['created_at']=date('D, d M, Y', strtotime($r->created_at));
            $nestedData['action'] ='<a class="btn btn-warning btn-xs editmdl" data-pid="'.$r->id.'" data-pttl="'.$r->type_name.'" data-ptopic="'.$r->seats.'" data-pmobile="'.$r->mobile.'" data-pimg="'.asset('public/uploads/driver/'.$r->profile_picture).'" data-dimg="'.asset('public/uploads/driver/'.$r->license_picture).'" '
                    .  'data-paddress="'.$r->address.'" data-plid="'.$r->license_issue_date.'" data-pled="'.$r->license_expiry_date.'" class=""><i class="ti-pencil-alt"></i></a> '
                    . '<a href="#" class="delmdl" data-did="'.$r->id.'" data-ttl="'.$r->title.'" style="padding: 4px;"><i class="ficon feather icon-trash-2 danger"></i></a>';
            $data[] = $nestedData;
        }
    }     
        $json_data = array(
            "draw"        => intval($request->input('draw')),
            "recordsTotal"    => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data"        => $data
        );
        echo json_encode($json_data);                                 
    }

      public function saveVehicleType(Request $request) 
    {  
        // dd($request->all());
        $company = Company::find(company_id());
        // DB::beginTransaction();
        $vtype = new VehicleType;
        $vtype->type_name = $request->type_name;
        $vtype->seats = $request->seats;
        $vtype->status = 1;
        $vtype->company_id = company_id();

        $vtype->save();

          //Update Driver Limit      
        // $company = Company::find($driver->company_id);
        // $company->drivers_limit = $company->drivers_limit-1;
       
        // $company->update();
        // update_package_limit('drivers_limit');
        // DB::commit();
        $notification = array(
                'message' => 'Type Saved Successfully',
                'type' => 'success'
        );
        // }
        
      
        return Response::json($notification); 
    }

        public function statusVehicleType(Request $request)
    {
        // dd($request->all());
        $vtype= VehicleType::find($request->id);
        // dd($driver);
        $vtype->status = $request->sts;
        $vtype->save();
        if($request->sts==1){
            $msg= 'Types is showing now';
            $type= 'success';
        }else{
            $msg= 'Type is hidden';
            $type= 'warning';
        }
        $notification = array(
                'message' => $msg,
                'type' => $type
            );
        return Response::json($notification); 
    }

         public function updateVehicleType(Request $request)
    {
        // $contact_image='';
        //          if($request->hasfile('upost_img'))
        // {
        //     $file = $request->file('upost_img');
        //     $contact_image = "profile_picture".time().'.'.$file->getClientOriginalExtension();
        //     $file->move(public_path()."/uploads/contacts/", $contact_image);
        // }
        $vtype = VehicleType::find($request->id);
        $vtype->type_name = $request->utitle;
        $vtype->seats=$request->ulink;        
        $vtype->save();
        $msg = 'Type Updated Successfully';$typ = 'success';   
        $notification = array('message' => $msg,'type' => $typ);
        return Response::json($notification); 
    }

        public function show(Request $request,$id)
    {
        $company_id = company_id();
        $data = array();

        $data['vehicle'] = Vehicle::leftjoin('vehicle_types as vt','vt.id','=','vehicles.type_id')->select('vehicles.*','vt.type_name')->where("vehicles.id",$id)
                                  ->where("vehicles.company_id", $company_id)->first();
                             
        $data['company']= Company::find($company_id);

        $data['invoices'] = Invoice::where('vehicle_id',$id)
                                   ->where("company_id", $company_id)
                                   ->get();
        $data['total_booking'] = DB::table('invoices')->where('vehicle_id',$id)->count();

        $data['invoice_value'] = DB::table('invoices')
                                    ->where('vehicle_id', $id)
                                    ->selectRaw('sum(grand_total) as grand_total, sum(paid) as paid')
                                    ->first();  
        $data['transactions'] = Transaction::leftjoin('invoices as i','i.id','=','transactions.invoice_id')->where('i.vehicle_id',$id)
                                           ->where("transactions.company_id", $company_id)->get();
                                    
        $data['invoice_due_amount'] = DB::table('invoices')
                                        ->selectRaw('sum(grand_total) as grand_total, sum(paid) as paid')
                                        ->whereRaw("(Status = 'Unpaid' or Status = 'Partially_Paid')")
                                        ->where('vehicle_id', $id)
                                        ->first();      
        // dd($data['vehicle']);
        if(! $request->ajax()){
            return view('backend.vehicle.show', $data);
        }else{
            return view('backend.accounting.contacts.contact.modal.view', $data);
        } 
        
    }

       public function showVehicles()
    {
        // dd(session('company_id'));
         $data = array();
         $data['vtypes'] = VehicleType::where("vehicle_types.company_id",company_id())
         ->where("vehicle_types.status",1)
         ->get();
         $data['drivers'] = Driver::where("drivers.company_id",company_id())
         ->where("drivers.status",1)
         ->get();
         return view('backend.vehicle.vehicle_list',$data);
    }

     public function listVehicles(Request $request){
        
       $columns = array(0 =>'model',1 =>'type_name',2=> 'reg_plate',3=> 'name',4=>'in_service',5=>'action');
        $totalData = Vehicle::where("vehicles.company_id",company_id())->count();
        $limit = $request->input('length');$start = $request->input('start');
        $order = $columns[$request->input('order.0.column')]; $dir = $request->input('order.0.dir');
        if(empty($request->input('search.value')))
        {
            $posts= Vehicle::leftjoin('vehicle_types as vt','vt.id','=','vehicles.type_id')
                    ->leftjoin('drivers as d','d.id','=','vehicles.driver_id') 
                    ->select('vehicles.*','d.name','vt.type_name') 
                    ->where("vehicles.company_id",company_id())
                    ->offset($start)->limit($limit)->orderBy("vehicles.id","desc")->get();
            $totalFiltered =  Vehicle::where("vehicles.company_id",company_id())->count();
        }
        else{
            $search = $request->input('search.value');
            $posts=Vehicle::leftjoin('vehicle_types as vt','vt.id','=','vehicles.type_id')
                    ->leftjoin('drivers as d','d.id','=','vehicles.driver_id') 
                    ->select('vehicles.*','d.name','vt.type_name') 
                    ->where("vehicles.company_id",company_id())
                    ->orwhere('model', 'like', "%{$search}%")
                    ->orwhere('d.name', 'like', "%{$search}%")
                    ->orwhere('vt.type_name', 'like', "%{$search}%")
                    ->offset($start)->limit($limit)
                    ->orderBy("vehicles.id","desc")->get();
            $totalFiltered =Vehicle::leftjoin('vehicle_types as vt','vt.id','=','vehicles.type_id')
                    ->leftjoin('drivers as d','d.id','=','vehicles.driver_id') 
                    ->select('vehicles.*','d.name','vt.type_name') 
                    ->where("vehicles.company_id",company_id())
                    ->orwhere('model', 'like', "%{$search}%")
                    ->orwhere('d.name', 'like', "%{$search}%")
                    ->orwhere('vt.type_name', 'like', "%{$search}%")
                    ->count();
        }
        $data = array();

    if($posts){
        foreach($posts as $r)
        {     
            
            $nestedData['model'] = $r->model;
            $nestedData['type_name'] = $r->type_name;
            $nestedData['reg_plate'] = $r->reg_plate;
            $nestedData['name'] = $r->name;
            
           if( $r->in_service==0){
                $in_service = '<div class="btn-group"><div class="badge badge-warning dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true" style="color:#f1f5fa"><span>Deactive</span></a>
                <div class="dropdown-menu" x-placement="top-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(4px, -165px, 0px);">
                    <a class="dropdown-item csts" data-id="'.$r->id.'" data-sts="1" href="#" style="">Active</a></div>
                </div>
                 </div>';
            }else{
                $in_service = '<div class="btn-group"><div class="badge badge-success dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true" style="color:#f1f5fa"><span>Active</span></a>
                <div class="dropdown-menu" x-placement="top-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(4px, -165px, 0px);">
                    <a class="dropdown-item csts" style="" data-id="'.$r->id.'" data-sts="0" href="#">Deactive</a></div>
                </div>
                </div>';
            }
            $nestedData['in_service']=$in_service;
            // $nestedData['created_at']=date('D, d M, Y', strtotime($r->created_at));
            $nestedData['action'] ='<a class="btn btn-warning btn-xs editmdl" data-pid="'.$r->id.'" data-pttl="'.$r->model.'" data-preg="'.$r->reg_plate.'" data-pmobile="'.$r->driver_id.'" data-ptype="'.$r->type_id.'" data-pled="'.$r->reg_exp_date.'" class=""><i class="ti-pencil-alt"></i></a> '
                    . '<a href="#" class="delmdl" data-did="'.$r->id.'" data-ttl="'.$r->title.'" style="padding: 4px;"><i class="ficon feather icon-trash-2 danger"></i></a>'.'<a href="'.action('VehicleController@show', $r->id).'" class="btn btn-primary btn-xs"><i class="ti-eye"></i></a>&nbsp;';
            $data[] = $nestedData;
        }
    }     
        $json_data = array(
            "draw"        => intval($request->input('draw')),
            "recordsTotal"    => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data"        => $data
        );
        echo json_encode($json_data);                                 
    }

      public function saveVehicle(Request $request) 
    {  
        // dd($request->all());
        $company = Company::find(company_id());
        $company = Company::find(company_id());
        if ($company['vehicles_limit']<=0) {
               $notification = array(
                'message' => 'Your have already reached your usages limit. You can upgrade your package !',
                'type' => 'warning'
        );
        }else{
              // DB::beginTransaction();
        $vehicle = new Vehicle;
        $vehicle->model = $request->model;
        $vehicle->reg_plate = $request->reg_plate;
        $vehicle->reg_exp_date = $request->reg_exp_date;
        $vehicle->type_id = $request->type_id;
        $vehicle->in_service=1;
        $vehicle->driver_id = $request->driver_id;
        $vehicle->company_id = company_id();

        $vehicle->save();

          //Update Driver Limit      
        // $company = Company::find($driver->company_id);
        // $company->drivers_limit = $company->drivers_limit-1;
       
        // $company->update();
        update_package_limit('vehicles_limit');
        // DB::commit();
        $notification = array(
                'message' => 'Vehicle Saved Successfully',
                'type' => 'success'
        );
     
        }
      
        
      
        return Response::json($notification); 
    }


        public function updateVehicle(Request $request)
    {
        // $contact_image='';
        //          if($request->hasfile('upost_img'))
        // {
        //     $file = $request->file('upost_img');
        //     $contact_image = "profile_picture".time().'.'.$file->getClientOriginalExtension();
        //     $file->move(public_path()."/uploads/contacts/", $contact_image);
        // }
        // dd($request->all());
        $vehicle = Vehicle::find($request->id);
        $vehicle->model = $request->utitle;
        $vehicle->reg_plate=$request->umobile;        
        $vehicle->reg_exp_date=$request->reg_exp_date; 
        $vehicle->type_id = $request->utype_id;
        $vehicle->driver_id = $request->driver_id;       
        $vehicle->update();
        $msg = 'Vehicle Updated Successfully';$typ = 'success';   
        $notification = array('message' => $msg,'type' => $typ);
        return Response::json($notification); 
    }

           public function statusVehicle(Request $request)
    {
        // dd($request->all());
        $vehicle= Vehicle::find($request->id);
        // dd($driver);
        $vehicle->in_service = $request->sts;
        $vehicle->save();
        if($request->sts==1){
            $msg= 'Vehicle in service';
            $type= 'success';
        }else{
            $msg= 'Vehicle is deactive';
            $type= 'warning';
        }
        $notification = array(
                'message' => $msg,
                'type' => $type
            );
        return Response::json($notification); 
    }

    public function get_vehicle_info($id = ''){
        $vehicle = Vehicle::where("id",$id)
                          ->where("in_service",1)
                          ->where("company_id",company_id())->first();
        echo json_encode($vehicle); 
    }
}
