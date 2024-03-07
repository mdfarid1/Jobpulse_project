@extends('layouts.app')

@section('content')

<div class="row">
	<div class="col-12">
	    <a class="btn btn-primary btn-xs ajax-modal" data-title="{{ _lang('Add User') }}" href="{{ route('users.create') }}"><i class="ti-plus"></i> {{ _lang('Add New') }}</a>
		<div class="card mt-2">
			<div class="card-body">
				<h4 class="mt-0 header-title d-none panel-title">{{ $title }}</h4>
				<table class="table table-bordered data-table">
					<thead>
					  <tr>
						<th>{{ _lang('ID') }}</th>
						<th class="text-center">{{ _lang('Avatar') }}</th>
						<th>{{ _lang('Profession') }}</th>
						<th>{{ _lang('Email') }}</th>
						{{-- <th>{{ _lang('Package') }}</th> --}}
						{{-- <th class="text-center">{{ _lang('Membership') }}</th> --}}
						<th>{{ _lang('Status') }}</th>
						<th class="text-center">{{ _lang('Action') }}</th>
					  </tr>
					</thead>
					<tbody>

					  @foreach($users as $key=>$user)
						<tr id="row_{{ $user->id }}">
							<td class='id'>{{ ++$key }}</td>
							<td class="text-center">
								<img src="{{ asset('public/uploads/profile/'.$user->profile_picture) }}" class="thumb-sm rounded-circle mr-2">
							</td>
							<td class='name'>{{ $user->company->business_name }}</td>
							<td class='email'>{{ $user->email }}</td>
							{{-- <td class='package_id'>{{ $user->company->package->package_name }}({{ ucwords($user->company->package_type) }})</td> --}}
							{{-- <td class='membership_type text-center'>{!! $user->company->membership_type == 'trial' ? (status(ucwords($user->company->membership_type), 'danger')) : (status(ucwords($user->company->membership_type), 'success')) !!}</td> --}}
							<td class='status'>{!! $user->company->status == 1 ? (status(_lang('Member'), 'success')) : (status(_lang('Trial'), 'danger')) !!}</td>
							<td class="text-center">
							  <form action="{{ action('UserController@destroy', $user['id']) }}" method="post">
								<a href="{{ action('UserController@edit', $user['id']) }}" data-title="{{ _lang('Update User') }}" class="btn btn-outline-warning btn-xs ajax-modal">{{ _lang('Edit') }}</a>
								<a href="{{ action('UserController@show', $user['id']) }}" data-title="{{ _lang('View User') }}" class="btn btn-outline-primary btn-xs ajax-modal">{{ _lang('View') }}</a>
                                {{-- <a href="{{ route('switch.user.to.another', $user['id']) }}"  class="btn btn-outline-secondary">{{ _lang('Log As') }}</a> --}}
								{{ csrf_field() }}
								<input name="_method" type="hidden" value="DELETE">
								<button class="btn btn-outline-danger btn-xs btn-remove" type="submit">{{ _lang('Delete') }}</button>
							  </form>
							</td>
						</tr>
					  @endforeach
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

@endsection


