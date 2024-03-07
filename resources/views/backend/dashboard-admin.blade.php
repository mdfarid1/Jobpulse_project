@extends('layouts.app')

@section('content')
<!--Start Card-->
<div class="row">
    <div class="col-lg-3 mb-3">
		<div class="card">
			<div class="seo-fact sbg1">
				<div class="p-4">
					<div class="seofct-icon">
					    <i class="ti-user"></i>
						<span class="float-right">{{ _lang('Total Members') }}</span>
					</div>
					<h2 class="text-right">{{ $total_user }}</h2>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-3 mb-3">
		<div class="card">
			<div class="seo-fact sbg2">
				<div class="p-4">
					<div class="seofct-icon">
						<i class="ti-shopping-cart"></i>
						<span class="float-right">{{ _lang('Total Job Circulers') }}</span>
					</div>
					<h2 class="text-right">{{ $total_blog }}</h2>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-3 mb-3">
		<div class="card">
			<div class="seo-fact sbg3">
				<div class="p-4">
					<div class="seofct-icon">
						<i class="ti-alarm-clock"></i>
						<span class="float-right">{{ _lang('Total Candidates') }}</span>
					</div>
					<h2 class="text-right">{{ $total_candidates  }}</h2>
				</div>
			</div>
		</div>
	</div>

	<div class="col-lg-3 mb-3">
		<div class="card">
			<div class="seo-fact sbg4">
				<div class="p-4">
					<div class="seofct-icon">
						<i class="ti-credit-card"></i>
						<span class="float-right">{{ _lang('Total Visitor') }}</span>
					</div>
					<h2 class="text-right">
                        <div id="CounterVisitor">
                        </div>

                   </h2>
				</div>
			</div>
		</div>
	</div>

</div><!--end row-->

<!--End Card-->


<!--New Users-->
<div class="row">
   <div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<h4 class="header-title mt-0 mb-3">{{ _lang('Registered Members') }}</h4>
				<div class="table-responsive browser_users">
					<table class="table table-bordered mb-0">
						<thead class="thead-light">
							<tr>
								<th class="text-center">{{ _lang('Profile') }}</th>
								<th>{{ _lang('Name') }}</th>
								<th class="text-center">{{ _lang('Membership') }}</th>
								<th class="text-center">{{ _lang('Join Date') }}</th>
								<th class="text-center">{{ _lang('Action') }}</th>
							</tr>
						</thead>
						<tbody>
						    @foreach($users as $user)
                            @if($user->user_type == "user")
								<tr>
                                        <td class="text-center">
                                            <img src="{{ asset('public/uploads/profile/'.$user->profile_picture) }}" class="thumb-sm rounded-circle mr-2">
                                        </td>
									<td class='name'>{{ $user->name }}</td>
                                    </td>

                                    <td class='status text-center'>{!! $user->status == 1 ? (status(_lang('Member'), 'info')) : (status(_lang('Trial'), 'danger')) !!}</td>


									<td class='text-center'>{{ $user->created_at }}</td>


                                   <td class="text-center">
                                    <form action="{{ action('UserController@destroy', $user['id']) }}" method="post">
                                      <a href="{{ action('UserController@edit', $user['id']) }}" data-title="{{ _lang('Update User') }}" class="btn btn-outline-warning btn-xs ajax-modal">{{ _lang('Edit') }}</a>
                                      <a href="{{ action('UserController@show', $user['id']) }}" data-title="{{ _lang('View User') }}" class="btn btn-outline-primary btn-xs ajax-modal">{{ _lang('View') }}</a>

                                      {{ csrf_field() }}
                                      <input name="_method" type="hidden" value="DELETE">
                                      <button class="btn btn-outline-danger btn-xs btn-remove" type="submit">{{ _lang('Delete') }}</button>
                                    </form>
                                  </td>
								</tr>
                                @endif
							@endforeach
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!--End New Users-->

<div class="row">
    <div class="col-lg-12">
         <div class="card">
             <div class="card-body">
                 <h4 class="header-title mt-0 mb-3">{{ _lang('Candidates List') }}</h4>
                 <div class="table-responsive browser_users">
                     <table class="table table-bordered mb-0">
                         <thead class="thead-light">
                             <tr>
                                 <th class="text-center">{{ _lang('Profile') }}</th>
                                 <th>{{ _lang('Name') }}</th>
                                 <th class="text-center">{{ _lang('Membership') }}</th>
                                 <th class="text-center">{{ _lang('Join Date') }}</th>
                                 <th class="text-center">{{ _lang('Action') }}</th>
                             </tr>
                         </thead>
                         <tbody>
                             @foreach($users as $user)
                             @if($user->user_type == "client")
                                 <tr>
                                         <td class="text-center">
                                             <img src="{{ asset('public/uploads/profile/'.$user->profile_picture) }}" class="thumb-sm rounded-circle mr-2">
                                         </td>
                                     <td class='name'>{{ $user->name }}</td>
                                     </td>

                                     <td class='status text-center'>{!! $user->user_type == 'client' ? (status(_lang('Candidate'), 'danger')) : (status(_lang('Trial'), 'danger')) !!}</td>


                                     <td class='text-center'>{{ $user->created_at }}</td>


                                    <td class="text-center">
                                     <form action="{{ action('UserController@destroy', $user['id']) }}" method="post">
                                       <a href="{{ action('UserController@edit', $user['id']) }}" data-title="{{ _lang('Update User') }}" class="btn btn-outline-warning btn-xs ajax-modal">{{ _lang('Edit') }}</a>
                                       <a href="{{ action('UserController@show', $user['id']) }}" data-title="{{ _lang('View User') }}" class="btn btn-outline-primary btn-xs ajax-modal">{{ _lang('View') }}</a>

                                       {{ csrf_field() }}
                                       <input name="_method" type="hidden" value="DELETE">
                                       <button class="btn btn-outline-danger btn-xs btn-remove" type="submit">{{ _lang('Delete') }}</button>
                                     </form>
                                   </td>
                                 </tr>
                                 @endif
                             @endforeach
                         </tbody>
                     </table>
                 </div>
             </div>
         </div>
     </div>
 </div>

<script>
    var n = localStorage.getItem('on_load_counter');

    if (n === null) {
      n = 0;
    }
    n++;

    localStorage.setItem("on_load_counter", n);

    nums = n.toString().split('').map(Number);
    document.getElementById('CounterVisitor').innerHTML = '';
    for (var i of nums) {
      document.getElementById('CounterVisitor').innerHTML += '<span class="counter-item">' + i + '</span>';
    }

    </script>
@endsection

