<?php

namespace App\Http\Controllers;

use App\Blog;
use Illuminate\Http\Request;
use App\Transaction;
use App\Invoice;
use App\Models\Apply;
use App\Project;
use App\User;
use DB;
use Auth;
use Carbon\Carbon;

class DashboardController extends Controller
{

	public function __construct()
    {
		date_default_timezone_set(get_company_option('timezone',get_option('timezone','Asia/Dhaka')));
    }


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
		$type = Auth::user()->user_type;

		if( $type  == 'admin' ){
			$data = array();
			// $data['total_user'] = \App\User::where('user_type','user')
			// 							   ->count();
            $data['total_user'] = \App\User::where('user_type','user')
                                           ->count();
             $data['total_candidates'] = \App\User::where('user_type','client')
                                           ->count();
			$data['paid_user'] = \App\Company::where('membership_type','member')
										     ->count();
            //  $data['total_blog'] =Blog::where('user_id','id')
			// 							     ->count();
			$data['total_blog'] =Blog::count();
            // dd($data);



			$data['trial_user'] = \App\User::where('status','0')
										      ->count();

			$data['total_payment'] = \App\PaymentHistory::selectRaw('SUM(amount) as total')
						                                ->where('status','paid')
													    ->first()->total;
			$data['users'] =User::all();


			$data['news_users'] = \App\User::where("user_type","user")
										   ->orderBy("id","desc")
			                               ->limit(5)->get();

			$data['recent_payment'] = \App\PaymentHistory::where('status','paid')
										                 ->limit(5)
														 ->orderBy('id','desc')
														 ->get();

			return view('backend/dashboard-'.$type,$data);
		}else if( $type  == 'client' ){
			$client_ids = Auth::user()->client->pluck('id');

            $data = array();
			$data['company_currency'] = array();
			$data['currency_position'] = array();

            foreach(Auth::user()->client as $client){
                  $data['company_currency'][$client->company_id] = get_company_field($client->company_id,'base_currency');
                  $data['currency_position'][$client->company_id] = get_company_field($client->company_id,'currency_position');
            }


			$data['invoices'] = Invoice::whereIn('client_id',$client_ids)
									   ->orderBy('id','desc')
									   ->limit(5)
									   ->get();

			$data['transactions'] = Transaction::whereIn('payer_payee_id',$client_ids)
											   ->orderBy('id','desc')
											   ->limit(5)
											   ->get();

			$data['recent_projects'] = Project::whereIn('client_id',$client_ids)
											  ->orderBy('id','desc')
											  ->limit(5)
											  ->get();
            // $data['apply'] =Blog::with('applies')->get();
            // dd($data);
			//Summary Data
            $data['applies'] = Apply::with('user', 'blog')->get();
            // dd($data);
			$data['total_project'] = DB::table('projects')->whereIn('client_id', $client_ids)->count();


			$data['invoice_value'] = DB::table('invoices')
										->whereIn('client_id', $client_ids)
										->selectRaw('sum(grand_total) as grand_total, sum(paid) as paid')
										->first();

			$data['invoice_due_amount'] = DB::table('invoices')
											->selectRaw('sum(grand_total) as grand_total, sum(paid) as paid')
											->whereRaw("(Status = 'Unpaid' or Status = 'Partially_Paid')")
											->whereIn('client_id',$client_ids)
											->first();


			return view('backend/dashboard-'.$type,$data);
		}else if( $type  == 'user' ){
			$company_id = company_id();
            // $user_id = id();
			$data = array();
			$data['total_present'] = \App\Attendance::where('company_id',$company_id)
			                         ->whereDate('attendances.created_at', Carbon::today())
									 ->count();
			$data['current_month_expense'] = current_month_expense();
            $project_status = \App\Project::where('company_id',$company_id)
                                          ->selectRaw('status, COUNT(id) as c')
                                          ->groupBy('status')
                                          ->get();

            foreach($project_status as $status){
            	$data['project_status'][$status->status] = $status->c;
            }

            $data['blog'] = User::with('blogs')->find(Auth::user()->id);
        //    dd($data);
               $data['blog_count'] = Blog::where('user_id',Auth::user()->id)->count();

                $data['applies'] = Apply::with('user', 'blog')->where('user_id',Auth::user()->id,'id')->count();
            //    dd($data);

            // $user_id = Auth::user()->id;
            // dd($user_id);
    // Retrieve blogs with applies count for the specified user
            //   $blogsWithJobCount = Blog::with('applies')
            //                  ->where(Auth::user()->id,'company_id')
            //                  ->get();
            //                  dd($blogsWithJobCount);

            $data['total_student'] = \App\Contact::where('company_id',$company_id)->count();

			$data['absent_today']= $data['total_student'] - $data['total_present'];

            $data['unpaid_invoice_count'] = \App\Invoice::where('status','Unpaid')
            										    ->where('company_id',$company_id)->count();
            $data['canceled_invoice_count'] = \App\Invoice::where('status','Canceled')
            										      ->where('company_id',$company_id)->count();

			$data['late_attendees'] = DB::table('attendances')
                        			->leftJoin('institute_classes', 'attendances.class_id', '=', 'institute_classes.id')
                        			->select(DB::raw('COUNT(attendances.id) AS late'))
                        			->where('attendances.company_id', '=', $company_id)
                        			->whereDate('attendances.created_at', '=',Carbon::today())
                        			->whereColumn('entry_at', '>', 'start_time')
                        			->get()
                        			->pluck('late')
                        			->first();
			// dd($data['late_attendees']);

            $data['invoice_due_amount'] = DB::table('invoices')
											->selectRaw('sum(grand_total) as grand_total, sum(paid) as paid')
											->where('company_id',$company_id)
											->whereRaw("(Status = 'Unpaid' or Status = 'Partially_Paid')")
											->first();


			return view('backend/dashboard-'.$type,$data);
		}else if($type  == 'staff' ){
			$company_id = company_id();
			$data = array();

            $project_status = \App\Project::join('project_members','projects.id','project_members.project_id')
                                          ->where('project_members.user_id', Auth::id())
                                          ->selectRaw('status, COUNT(projects.id) as c')
                                          ->groupBy('status')
                                          ->get();

            $data['total_project'] = 0;
            foreach($project_status as $status){
            	$data['total_project'] += $status->c;
            	$data['project_status'][$status->status] = $status->c;
            }
            $data['applie'] = Apply::with('user', 'blog')->where('user_id',Auth::user()->id,'id')->count();


			return view('backend/dashboard-'.$type,$data);
		}
    }


	public function json_month_wise_income_expense(){
	  $income = $this->month_wise_income();
	  $expense = $this->month_wise_expense();

	  $months = '"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21",
	  "22","23","24","25","26","27","28","29","30"';
	  $income_string = '';
	  $expense_string = '';

	  foreach($income as $i){
		 $income_string = $income_string.$i->amount.",";
	  }

	  $income_string = rtrim($income_string, ",");
	//   dd($income_string);
	  foreach($expense as $e){
		 $expense_string = $expense_string.$e->amount.",";
	  }
	  $expense_string = rtrim($expense_string, ",");

	  echo '{"Months":['.$months.'], "Income":['.$income_string.'], "Expense":['.$expense_string.']}';
	  exit();
	}

	public function json_income_vs_expense(){
	   $income = $this->current_month_income();
	   $expense = $this->current_month_expense();
	   echo '{"Income":['.$income.'], "Expense":['.$expense.']}';
	   exit();
	}

	private function month_wise_income(){
		$company_id = company_id();
		$date = date("Y-m-d");
		// dd($date);
		$query = DB::select("SELECT m.month, IFNULL(COUNT(attendances.id),0) as amount
		FROM ( SELECT 1 AS MONTH UNION SELECT 2 AS MONTH UNION SELECT 3 AS MONTH UNION SELECT 4 AS MONTH
		UNION SELECT 5 AS MONTH UNION SELECT 6 AS MONTH UNION SELECT 7 AS MONTH UNION SELECT 8 AS MONTH
		UNION SELECT 9 AS MONTH UNION SELECT 10 AS MONTH UNION SELECT 11 AS MONTH UNION SELECT 12 AS MONTH  UNION SELECT 13 AS MONTH  UNION SELECT 14 AS MONTH
		UNION SELECT 15 AS MONTH  UNION SELECT 16 AS MONTH  UNION SELECT 17 AS MONTH  UNION SELECT 18 AS MONTH  UNION SELECT 19 AS MONTH  UNION SELECT 20 AS MONTH
		UNION SELECT 21 AS MONTH  UNION SELECT 22 AS MONTH  UNION SELECT 23 AS MONTH  UNION SELECT 24 AS MONTH  UNION SELECT 25 AS MONTH  UNION SELECT 26 AS MONTH
		UNION SELECT 27 AS MONTH  UNION SELECT 28 AS MONTH  UNION SELECT 29 AS MONTH UNION SELECT 30 AS MONTH UNION SELECT 31 AS MONTH) AS m
		LEFT JOIN attendances ON m.month = DAYOFMONTH(attendances.created_at) AND MONTH(attendances.created_at)=MONTH('$date')
		AND attendances.exit_at IS NOT NULL AND company_id='$company_id' GROUP BY m.month ORDER BY m.month ASC");
		// var_dump($query);
		// die();
	    return $query;
	}

	private function month_wise_expense(){
		$company_id = company_id();
		$total_student = \App\Contact::where('company_id',$company_id)->count();
		$date = date("Y-m-d");
		$query =DB::select("SELECT m.month, IFNULL($total_student - COUNT(attendances.id),0) as amount
		FROM ( SELECT 1 AS MONTH UNION SELECT 2 AS MONTH UNION SELECT 3 AS MONTH UNION SELECT 4 AS MONTH
		UNION SELECT 5 AS MONTH UNION SELECT 6 AS MONTH UNION SELECT 7 AS MONTH UNION SELECT 8 AS MONTH
		UNION SELECT 9 AS MONTH UNION SELECT 10 AS MONTH UNION SELECT 11 AS MONTH UNION SELECT 12 AS MONTH  UNION SELECT 13 AS MONTH  UNION SELECT 14 AS MONTH
		UNION SELECT 15 AS MONTH  UNION SELECT 16 AS MONTH  UNION SELECT 17 AS MONTH  UNION SELECT 18 AS MONTH  UNION SELECT 19 AS MONTH  UNION SELECT 20 AS MONTH
		UNION SELECT 21 AS MONTH  UNION SELECT 22 AS MONTH  UNION SELECT 23 AS MONTH  UNION SELECT 24 AS MONTH  UNION SELECT 25 AS MONTH  UNION SELECT 26 AS MONTH
		UNION SELECT 27 AS MONTH  UNION SELECT 28 AS MONTH  UNION SELECT 29 AS MONTH UNION SELECT 30 AS MONTH UNION SELECT 31 AS MONTH) AS m
		LEFT JOIN attendances ON m.month = DAYOFMONTH(attendances.created_at) AND MONTH(attendances.created_at)=MONTH('$date')
		AND attendances.exit_at IS NOT NULL AND company_id='$company_id' GROUP BY m.month ORDER BY m.month ASC");
	    return $query;
	}


  private function current_month_income(){
     $company_id = company_id();
	 $date = date("Y-m-d");
	 $query = DB::select("SELECT IFNULL(SUM(base_amount),0) as amount FROM transactions WHERE dr_cr='cr'
	 AND trans_date BETWEEN ADDDATE(LAST_DAY(SUBDATE('$date', INTERVAL 1 MONTH)), 1) AND LAST_DAY('$date')
	 AND company_id='$company_id'");
	 return $query[0]->amount;
  }


  private function current_month_expense(){
	 $company_id = company_id();
	 $date = date("Y-m-d");
	 $query =  DB::select("SELECT IFNULL(SUM(base_amount),0) as amount FROM transactions WHERE dr_cr='dr'
	 AND trans_date BETWEEN ADDDATE(LAST_DAY(SUBDATE('$date', INTERVAL 1 MONTH)), 1) AND LAST_DAY('$date')
	 AND company_id='$company_id'");
	 return $query[0]->amount;
  }



  public function deleteUser(Request $request, $id)
    {
        // Find the blog post by ID
        $user = Auth::user()->find($id);

        // Check if the post exists
        if ($user) {
            // Delete the post
            $user->delete();

            // Optionally, you may want to add a success message
            return redirect('admin/dashboard')->with('success', 'Member deleted successfully.');
        }

        // If the post doesn't exist, redirect with an error message
        return redirect('admin/dashboard')->with('error', 'member post not found.');
    }


}
