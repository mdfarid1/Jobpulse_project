@extends('layouts.app')

@section('content')
<div class="row">
	<div class="col-12">
	<div class="card">
	<div class="card-body">

		@php $date_format = get_company_option('date_format','Y-m-d'); @endphp

	    <h4 class="d-none panel-title">{{ _lang('Subscription Details') }}</h4>
	    <table class="table table-bordered">
			@foreach($info as $i)
				<tr><td>{{ _lang('Package Name') }}</td><td>{{ $i->package_name }}</td></tr>
				<tr><td>{{ _lang('Package Valid Until') }}</td><td>{{ date($date_format, strtotime($i->valid_to)) }}</td></tr>
		        <tr>
		        	<td>{{ _lang('Membersip Type') }}</td><td>{!! $i->membership_type == 'trial' ? (status(ucwords($i->membership_type), 'danger')) : (status(ucwords($i->membership_type), 'success')) !!}</td>
		        </tr>
			@endforeach
	    </table>

	    @if($user->user_type == 'user')
		    <table class="table table-striped">
		    	@foreach($info as $i)
		    	<tr>
		    		<td colspan="2" class="text-center"><b>{{ _lang('Package Details') }}</b></td>
		    	</tr>

		    	<tr>
		    		<td><b>{{ _lang('Feature') }}</b></td>
		    		<td class="text-center"><b>{{ _lang('Package Limit') }}</b></td>
		    		<td class="text-center"><b>{{ _lang('Avaialble Limit') }}</b></td>

		    	</tr>
		    	{{-- <tr>
		    		<td>{{ _lang('Staff Limit') }}</td>
		    		<td class="text-center">{{ unserialize($i->staff_limit)[$i->package_type] }}</td>
		    		<td class="text-center">{{ $user->company->staff_limit }}</td>
		    	</tr> --}}
		    	<tr>
		    		<td>{{ _lang('Students Limit') }}</td>
		    		<td class="text-center">{{isset($i->contacts_limit) ? unserialize($i->contacts_limit)[$i->package_type] : 'No' }}</td>
		    		<td class="text-center">{{ $user->company->contacts_limit }}</td>
		    	</tr>
		    	{{-- <tr>
		    		<td>{{ _lang('Drivers Limit') }}</td>
		    		<td class="text-center">{{ isset($i->drivers_limit) ? unserialize($i->drivers_limit)[$i->package_type] : 'No' }}</td>
		    		<td class="text-center">{{ isset($user->company->drivers_limit)? $user->company->drivers_limit:'No' }}</td>
		    	</tr>
		    	<tr>
		    		<td>{{ _lang('Vehicles Limit') }}</td>
		    		<td class="text-center">{{ isset($i->vehicles_limit) ? unserialize($i->vehicles_limit)[$i->package_type] : 'No'}}</td>
		    		<td class="text-center">{{ isset($user->company->vehicles_limit)? $user->company->vehicles_limit:'No' }}</td>
		    	</tr>
		    	<tr>
		    		<td>{{ _lang('Invoice Limit') }}</td>
		    		<td class="text-center">{{ unserialize($i->invoice_limit)[$i->package_type] }}</td>
		    		<td class="text-center">{{ $user->company->invoice_limit }}</td>
		    	</tr>
		    	<tr>
		    		<td>{{ _lang('Quotation Limit') }}</td>
		    		<td class="text-center">{{ unserialize($i->quotation_limit)[$i->package_type] }}</td>
		    		<td class="text-center">{{ $user->company->quotation_limit }}</td>
		    	</tr>
		    	<tr>
		    		<td>{{ _lang('Project Management') }}</td>
		    		<td class="text-center">{{ unserialize($i->project_management_module)[$i->package_type]  }}</td>
		    		<td class="text-center">{{ ucwords($user->company->project_management_module) }}</td>
		    	</tr>
		    	<tr>
		    		<td>{{ _lang('Recurring Transaction') }}</td>
		    		<td class="text-center">{{ unserialize($i->recurring_transaction)[$i->package_type] }}</td>
		    		<td class="text-center">{{ ucwords($user->company->recurring_transaction) }}</td>
		    	</tr>
				<tr>
					<td>{{ _lang('Inventory Module') }}</td>
					<td class="text-center">{{ unserialize($i->inventory_module)[$i->package_type] }}</td>
					<td class="text-center">{{ ucwords($user->company->inventory_module) }}</td>
				</tr> --}}
		    	{{-- <tr>
		    		<td>{{ _lang('Live Chat') }}</td>
		    		<td class="text-center">{{ unserialize($i->live_chat)[$i->package_type] }}</td>
		    		<td class="text-center">{{ ucwords($user->company->live_chat) }}</td>
		    	</tr>
		    	<tr>
		    		<td>{{ _lang('File Manager') }}</td>
		    		<td class="text-center">{{ unserialize($i->file_manager)[$i->package_type] }}</td>
		    		<td class="text-center">{{ ucwords($user->company->file_manager) }}</td>
		    	</tr>
		    	<tr>
		    		<td>{{ _lang('Online Payment') }}</td>
		    		<td class="text-center">{{ unserialize($i->online_payment)[$i->package_type] }}</td>
		    		<td class="text-center">{{ ucwords($user->company->online_payment) }}</td>
		    	</tr> --}}
		    	<tr>
		    		<td>{{ _lang('SMS Panel') }}</td>
		    		<td class="text-center">{{ isset($i->sms_panel) ? unserialize($i->sms_panel)[$i->package_type] : 'No' }}</td>
		    		<td class="text-center">{{ ucwords($user->company->sms_panel) }}</td>
		    	</tr>
		    	@endforeach
		    </table>
	    @endif
	</div>
  </div>
 </div>
</div>
@endsection


