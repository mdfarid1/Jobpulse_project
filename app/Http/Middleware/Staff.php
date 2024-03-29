<?php

namespace App\Http\Middleware;

use Illuminate\Http\Response;
use Closure;
use Auth;

class Staff
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

		if(Auth::User()->user_type != 'staff' && Auth::User()->role_id!=null){
			if( ! $request->ajax()){
			   return back()->with('error',_lang('Permission denied !'));
			}else{
				return new Response('<h5 class="text-center red">'._lang('Permission denied !').'</h5>');
			}
		}
        return $next($request);
    }
}
