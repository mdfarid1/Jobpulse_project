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
@if (Auth::user()->status==1)

<!--Start Card-->
<div class="row">
{{-- @dd($circukler->user_id); --}}

@if ($blog)

	<div class="col-lg-6 mb-3">
		<div class="card">
			<div class="seo-fact sbg1">
				<div class="p-4">
					<div class="seofct-icon">
						<span>{{ _lang('Published Circular') }}</span>
					</div>
					<h2>{{ $blog_count }}</h2>
				</div>
			</div>
		</div>
	</div>



	 <div class="col-lg-6 mb-3">
		<div class="card">
			<div class="seo-fact sbg4">
				<div class="p-4">
					<div class="seofct-icon">
						<span>{{ _lang('Candidate Applied') }}</span>
					</div>
					<h2>{{ number_format($applies) }}</h2>
				</div>
			</div>
		</div>
	</div>
@endif


</div>
<div class="row">
  <div class="col-md-12">
	 <div class="card">
		<div class="card-body">
		   <h4 class="header-title mt-0">{{ _lang('Our Ability')." - ".date('F') }}</h4>
		   <div id="yearly_income_expense"></div>
		</div>
	 </div>
  </div>
</div>
@else
<div class="col-lg-3 m-auto">
    <div class="card">
        <div class="seo-fact sbg1">
            <div class="p-4">
                <div class="seofct-icon">
                    <span>{{ _lang('Trial User') }}</span>
                </div>
                <h2>ড্যাশবোর্ড তৈরির কাজ চলমান আছে,
                    শীঘ্রই পাওয়া যাবে।</h2>
            </div>
        </div>
    </div>
</div>
@endif

@endsection

@section('js-script')
<script src="{{ asset('public/backend/assets/js/dashboard.js?v=1.1') }}"></script>
@endsection
