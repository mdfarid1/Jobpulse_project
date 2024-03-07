@extends('theme.default.layouts.website')

@section('header')
<div class="page-hero bg_cover" style="background-image: url({{ get_option('sub_banner_image') != '' ? asset('public/uploads/media/'.get_option('sub_banner_image')) : theme_asset('assets/images/header-bg.jpg') }})">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-8 col-lg-10">
				<div class="header-content text-center">
					<h3 class="header-title">{{ _lang('OUR Governor List') }}</h3>
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
<div class="container card-container">
<div class="col-md-12">
    <div class="row">
    @foreach ($governor as $data)
        <div class=" card col-md-3 m-auto">
            @if (!empty($data->img))
            <img src="{{ asset('public/uploads/govornor/'.$data->img) }}" alt="Card Image">
            @else
            <img src="{{ asset('public/uploads/govornor/default.png') }}" alt="Card Image">

            @endif
            <div class="card-content">
                <h2 class="card-title">{{ $data->title }}</h2>
                <p class="card-name font-weight-bold">{{ $data->name }}</p>
            </div>
        </div>
    @endforeach
  </div>
</div>

</div>

@endsection
