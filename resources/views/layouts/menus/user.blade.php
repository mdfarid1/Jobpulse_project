
@if (Auth::user()->status==1)


<li>
	<a href="javascript: void(0);"><i class="ti-book"></i><span>{{ _lang('Circular') }}</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
	<ul class="nav-second-level" aria-expanded="false">
		<li class="nav-item"><a class="nav-link" href="{{ url('circular/list') }}">{{ _lang('All Circular') }}</a></li>
		<li class="nav-item"><a class="nav-link" href="{{ url('circular/create') }}">{{ _lang('Add New') }}</a></li>
	</ul>
</li>

<li>
	<a href="{{ url('profile/edit') }}"><i class="ti-user"></i><span>{{ _lang('Profile') }}</span></a>
</li>

<li>
	<a href="{{ url('apply/list') }}"><i class="fas fa-tty"></i><span>{{ _lang('Apply List') }}</span></a>
</li>

{{-- @if( has_feature('staff_limit') ) --}}
<li>
<li>
	<a href="javascript: void(0);"><i class="ti-user"></i><span>{{ _lang('Employee') }}</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
	<ul class="nav-second-level" aria-expanded="false">
		<li class="nav-item"><a class="nav-link" href="{{ url('staffs') }}">{{ _lang('All Staffs') }}</a></li>
		<li class="nav-item"><a class="nav-link" href="{{ route('roles.index') }}">{{ _lang('Staffs Roles') }}</a></li>
	</ul>
</li>
{{-- @endif --}}

<li>
	<a href="javascript: void(0);"><i class="ti-settings"></i><span>{{ _lang('Settings') }}</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
	<ul class="nav-second-level" aria-expanded="false">
		<li class="nav-item"><a class="nav-link" href="{{ url('company/general_settings') }}">{{ _lang('Company Settings') }}</a></li>
		<li class="nav-item"><a class="nav-link" href="{{ url('company_email_template') }}">{{ _lang('Email Template') }}</a></li>
	</ul>
</li>
@else
<li>
	<a href="#"><i class="ti-check-box"></i><span>{{ _lang('Trial Version') }}</span></a>
</li>
@endif
