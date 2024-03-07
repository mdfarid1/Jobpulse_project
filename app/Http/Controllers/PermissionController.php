<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Route;
use App\AccessControl;
use Auth;

class PermissionController extends Controller
{
    public function index($role_id = '')
    {
		$permission_list = array();
		$role_id = $role_id;

		if ($role_id !=''){
		   $permission_list = AccessControl::where("role_id",$role_id)
										   ->pluck('permission')
										   ->toArray();
		}

		$notallowed = array(
            'Laravel\Sanctum\Http\Controllers\CsrfCookieController',
            'App\Http\Controllers\BkashTokenizePaymentController',
		    '\App\Http\Controllers\Auth\LoginController',
		    'App\Http\Controllers\Auth\LoginController',
			'App\Http\Controllers\Auth\RegisterController',
			'App\Http\Controllers\Auth\ForgotPasswordController',
			'App\Http\Controllers\Auth\ResetPasswordController',
			'App\Http\Controllers\Auth\VerificationController',
			'App\Http\Controllers\DashboardController',
			'App\Http\Controllers\EmailSubscriberController',
			'App\Http\Controllers\ProfileController',
			'App\Http\Controllers\AccountController',
			'App\Http\Controllers\BlogController',
            'App\Http\Controllers\GalleryController',
			'App\Http\Controllers\ChartOfAccountController',
            // 'App\Http\Controllers\ContactController',
			'App\Http\Controllers\ContactGroupController',
			'App\Http\Controllers\DriverController',
			'App\Http\Controllers\ExpenseController',
			'App\Http\Controllers\IncomeController',
			'App\Http\Controllers\InvoiceController',
			'App\Http\Controllers\UserController',
			'App\Http\Controllers\LanguageController',
			'App\Http\Controllers\LeadController',
			'App\Http\Controllers\LeadStatusController',
			'App\Http\Controllers\LeadSourceController',
			'App\Http\Controllers\UtilityController',
			'App\Http\Controllers\VehicleController',
            'App\Http\Controllers\PaymentMethodController',
            'App\Http\Controllers\ProjectController',
            'App\Http\Controllers\ProjectMilestoneController',
            'App\Http\Controllers\ProductController',
            'App\Http\Controllers\ProductUnitController',
            'App\Http\Controllers\PurchaseController',
            'App\Http\Controllers\PurchaseReturnController',
            'App\Http\Controllers\QuotationController',
            'App\Http\Controllers\RepeatingIncomeController',
            'App\Http\Controllers\RepeatingExpenseController',
            'App\Http\Controllers\SalesReturnController',
			'App\Http\Controllers\StaffController',
			'App\Http\Controllers\SmsController',
			'App\Http\Controllers\TransferController',
			'App\Http\Controllers\RoleController',
			'App\Http\Controllers\SupplierController',
			'App\Http\Controllers\ServiceController',
			'App\Http\Controllers\EmailTemplateController',
			'App\Http\Controllers\FileManagerController',
			'App\Http\Controllers\TaxController',
			'App\Http\Controllers\TaskController',
			'App\Http\Controllers\TaskStatusController',
			'App\Http\Controllers\TimeSheetController',
			'App\Http\Controllers\PackageController',
			'App\Http\Controllers\PaymentController',
			'App\Http\Controllers\FaqController',
			'App\Http\Controllers\FeatureController',
			'App\Http\Controllers\MembershipController',
			'App\Http\Controllers\CronJobsController',
			'App\Http\Controllers\ChatController',
			'App\Http\Controllers\PermissionController',
			'App\Http\Controllers\API\UserController',
			'App\Http\Controllers\Install\InstallController',
			'App\Http\Controllers\Install\UpdateController',
            'Spatie\LaravelIgnition\Http\Controllers\HealthCheckController',
            'Spatie\LaravelIgnition\Http\Controllers\ExecuteSolutionController',
            'Spatie\LaravelIgnition\Http\Controllers\UpdateConfigController',
		);

		//Get Subscribed Package Details
		if( has_membership_system() == 'enabled' ){
		    $company = Auth::user()->company;
			$package_fields = array(
				'contacts_limit'             => 'App\Http\Controllers\ContactController',
				'invoice_limit'              => 'App\Http\Controllers\InvoiceController',
				'quotation_limit'            => 'App\Http\Controllers\QuotationController',
				'project_management_module'  => array(
													'App\Http\Controllers\ProjectController',
													'App\Http\Controllers\LeadController',
													'App\Http\Controllers\TaskController',
													'App\Http\Controllers\LeadSourceController',
													'App\Http\Controllers\LeadStatusController',
													'App\Http\Controllers\ProjectMilestoneController',
													'App\Http\Controllers\TaskStatusController',
													'App\Http\Controllers\TimeSheetController',
												),
				'recurring_transaction'      => array(
													'App\Http\Controllers\RepeatingExpenseController',
													'App\Http\Controllers\RepeatingIncomeController',
												),
				'file_manager'               => 'App\Http\Controllers\FileManagerController',
				'inventory_module'           => array(
													'App\Http\Controllers\PurchaseController',
													'App\Http\Controllers\SalesReturnController',
													'App\Http\Controllers\SalesReturnController',
				                                ),
			);

			foreach($package_fields as $key => $value){
				if($company->$key == 'No'){
					if( ! is_array($value) ){
						array_push($notallowed, $value);
					}else{
						foreach($value as $sub_value){
							array_push($notallowed, $sub_value);
						}
					}
				}
			}
		}

		$ignoreRoute = array(
		    //'events.show',
			//'notices.show',
		);

		$app = app();

		$routeCollection = $app->routes->getRoutes();

		$routes = [];


		// loop through the collection of routes
		foreach ($routeCollection as $route) {

			// get the action which is an array of items
			$action = $route->getAction();

			// if the action has the key 'controller'
			if (array_key_exists('controller', $action)) {

				// explode the string with @ creating an array with a count of 2
				$explodedAction = explode('@', $action['controller']);

				//If not needed so ignore
				if(in_array($explodedAction[0],$notallowed)){
					continue;
				}

				if (!isset($routes[$explodedAction[0]])) {
					$routes[$explodedAction[0]] = [];
				}
                // dd($explodedAction);
				$test = new $explodedAction[0]();
				if(method_exists($test ,$explodedAction[1])){
				    $routes[$explodedAction[0]][] = array("method"=>$explodedAction[1],"action"=>$route->action);
				}
			}
		}

		$permission = array();

		foreach($routes as $key => $route){
			foreach($route as $r){
				if (strpos($r['method'], 'get') === 0) {
				   continue;
				}

                if(array_key_exists('as',$r['action'])){
					$routeName = $r['action']['as'];
                    //If not needed so ignore
					if(in_array($routeName, $ignoreRoute)){
						continue;
					}
			    	$permission[$key][$routeName] = $r['method'];
				}

			}
		}



		foreach($permission as $key => $val){
			foreach($val as $name => $url){
				if($url == "store" && in_array("create", $val)){
					unset($permission[$key][$name]);
				}
				if($url == "update" && in_array("edit", $val)){
					unset($permission[$key][$name]);
				}
			}
		}

		return view('backend.permission.create',compact('permission','permission_list','role_id'));

    }

	public function store(Request $request){
		$this->validate($request, [
            'role_id'     => 'required',
            'permissions' => 'required'
        ]);

		$permission = AccessControl::where('role_id', $request->role_id);
        $permission->delete();

		foreach($request->permissions as $role){
			$permission = new AccessControl();
			$permission->role_id = $request->role_id;
			$permission->permission = $role;
			$permission->save();
		}

		return redirect('permission/control')->with('success', _lang('Saved Sucessfully'));

	}


}
