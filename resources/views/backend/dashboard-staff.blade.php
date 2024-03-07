@extends('layouts.app')

@section('content')

@if (\Session::has('paypal_success'))
  <div class="alert alert-success text-center">
	<b>{{ \Session::get('paypal_success') }}</b>
  </div>
  <br>
@endif

@php
$currency = currency();
$date_format = get_company_option('date_format','Y-m-d');
@endphp

<!--Start Card-->
<div class="row">

    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title mt-0 mb-3">{{ _lang('Total Applied') }}</h4>
                  <div class="table-responsive">
                      <table class="table table-bordered">
                          <thead>
                            <tr>
                                <th>{{ _lang('Name') }}</th>
                                <th>{{ _lang('Job Title') }}</th>
                                <th>{{ _lang('Apply Date') }}</th>
                                <th>{{ _lang('Status') }}</th>
                                <th class="text-center">{{ _lang('Action') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($applie as $apply)
                                @if ($apply->company_id === Auth::user()->company_id)
                                    <tr>
                                        <td>{{ $apply->user->name }}</td>
                                        <td>{{ $apply->blog->title }}</td>
                                        <td>{{ $apply->created_at }}</td>
                                        @if (($apply->status=='On Hold'))
                                        <td><span class="badge bg-warning text-dark">Pending</span></td>
                                        @else
                                        <td><span class="badge bg-success text-dark">{{ $apply->status }}</span></td>

                                        @endif
                                        <td class="text-center">
                                            <div>
                                                <form action="{{ route('delete.apply', ['id' => $apply->id]) }}" method="post">
                                                    @csrf
                                                    @method('post')
                                                    <button class="btn" onclick="return confirm('Are you sure you want to delete this Apply?')"><i class="ti-trash text-danger"></i></button>
                                                </form>
                                            </div>
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

<div class="row d-flex align-items-stretch">

  <!-- Panel 1 -->
  {{-- <div class="col-md-6">
	 <div class="card h-100">
		<div class="card-body">
		    <h4 class="header-title mt-0">{{ _lang('My Recent Projects') }}</h4>
		    <div class="table-responsive card-scroll">
			    <table class="table">
				      <thead>
					    <tr>
							<th>{{ _lang('Name') }}</th>
							<th>{{ _lang('Start Date') }}</th>
							<th>{{ _lang('End Date') }}</th>
							<th>{{ _lang('Status') }}</th>
							<th class="text-center">{{ _lang('Action') }}</th>
					    </tr>
					</thead>
					<tbody>
						@foreach(Auth::user()->projects->take(10) as $project)
						    <tr>
								<td><a href="{{ action('ProjectController@show', $project->id) }}">{{ $project->name }}</a></td>
								<td>{{ date($date_format,strtotime($project->start_date)) }}</td>
								<td>{{ date($date_format,strtotime($project->end_date)) }}</td>
								<td>{!! (project_status($project->status)) !!}</td>
								<td>
									<form action="{{ action('ProjectController@destroy', $project['id']) }}" class="text-center" method="post">
										<a href="{{ action('ProjectController@edit', $project['id']) }}" data-title="'. _lang('Update Project') .'" class="btn btn-warning btn-xs ajax-modal"><i class="ti-pencil"></i></a>
										{{ csrf_field() }}
										<input name="_method" type="hidden" value="DELETE">
										<button class="btn btn-danger btn-xs btn-remove" type="submit"><i class="ti-eraser"></i></button>
									</form>
								</td>
							</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	 </div>
  </div> --}}
  <!-- End Panel 1 -->

  <!-- Panel 2 -->
  {{-- <div class="col-md-12 mt-4">
	 <div class="card h-100">
		<div class="card-body">
		   <h4 class="header-title mt-0">{{ _lang('My Recent Tasks') }}</h4>
		   <div class="table-responsive card-scroll">
			   <table class="table">
				    <thead>
					    <tr>
							<th>{{ _lang('Name') }}</th>
							<th>{{ _lang('Priority') }}</th>
							<th>{{ _lang('Status') }}</th>
							<th>{{ _lang('Deadline') }}</th>
							<th class="text-center">{{ _lang('Action') }}</th>
					    </tr>
					</thead>
					<tbody>
						@foreach(Auth::user()->tasks->take(10) as $task)
						    <tr>
								<td><a href="{{ action('TaskController@show', $task->id) }}" data-title="{{ $task->title }}" class="ajax-modal">{{ $task->title }}</a></td>
								<td>{!! (task_priority($task->priority)) !!}</td>
								<td>
									<span class='badge badge-primary' style='background:{$task->status->color}'>{{ $task->status->title }}</span>
								</td>
								<td>{{ date($date_format,strtotime($task->end_date)) }}</td>
								<td>
									<form action="{{ action('TaskController@destroy', $task['id']) }}" class="text-center" method="post">
										<a href="{{ action('TaskController@edit', $task['id']) }}" data-title="'. _lang('Update Project') .'" class="btn btn-warning btn-xs ajax-modal"><i class="ti-pencil"></i></a>
										{{ csrf_field() }}
										<input name="_method" type="hidden" value="DELETE">
										<button class="btn btn-danger btn-xs btn-remove" type="submit"><i class="ti-eraser"></i></button>
									</form>
								</td>
							</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	 </div>
  </div> --}}
  <!-- End Panel 2 -->
</div>

@endsection
