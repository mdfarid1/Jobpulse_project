@extends('layouts.app')

@section('content')

@php

$currency = currency();
$base_currency = base_currency();
$date_format = get_company_option('date_format','Y-m-d');

@endphp


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
                        @foreach ($applies as $apply)
                            @if ($apply->company_id === Auth::user()->id)
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
@endsection
