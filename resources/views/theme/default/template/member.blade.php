@extends('theme.default.layouts.website')

@section('header')
<div class="page-hero bg_cover" style="background-image: url({{ get_option('sub_banner_image') != '' ? asset('public/uploads/media/'.get_option('sub_banner_image')) : theme_asset('assets/images/header-bg.jpg') }})">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-8 col-lg-10">
				<div class="header-content text-center">
					<h3 class="header-title">{{ _lang('OUR Member') }}</h3>
				</div> <!-- header content -->
			</div>
		</div> <!-- row -->
	</div> <!-- container -->
</div> <!-- header content -->
@endsection

@php
$currency = currency();
$base_currency = base_currency();
$date_format = get_company_option('date_format','Y-m-d');
@endphp

@section('content')
<div class="container py-5 m-auto">
    <div class="row">
        @foreach ($users as $member)
            @if ($member->status == 1)
                <div class="col-12 mb-5 col-sm-6 col-md-3">
                    <div class="profile-card" style="box-shadow: 0 0 10px black;">
                        <a href="{{ url('/profile/'.$member->id) }}">
                            <img src="{{ asset('public/uploads/profile/'.$member->profile_picture) }}" alt="{{ $member->name }}" class="profile-image">
                            <h5>{{ $member->name }}</h5>
                            <p>{{ $member->company->business_name }}</p>
                        </a>
                        <h6 class="card-subtitle mt-2 text-muted"><small class="font-weight-bold">Join Date: {{ date($date_format, strtotime($member->created_at)) }}</small></h6>
                    </div>
                </div>
            @endif
        @endforeach
    </div>
</div>

<div class="container">
    {{ $users->links() }}
</div>
@endsection
