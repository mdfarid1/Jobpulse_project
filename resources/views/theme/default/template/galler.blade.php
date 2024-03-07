@extends('theme.default.layouts.website')

@section('header')
<div class="page-hero bg_cover" style="background-image: url({{ get_option('sub_banner_image') != '' ? asset('public/uploads/media/'.get_option('sub_banner_image')) : theme_asset('assets/images/header-bg.jpg') }})">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-8 col-lg-10">
				<div class="header-content text-center">
					<h3 class="header-title">{{ _lang('OUR Gallery') }}</h3>
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
<div class="container container-fluid" style="background-color: #f7ecd7;">
    <div class="gallery-container row">
      @foreach ($gallery as $data)
      <div class="gallery-card">
        <img src="{{ asset('public/uploads/gallery/'.$data->gallery_img) }}" alt="">
        <div class="card-text">{{ $data->title }}</div>
      </div>
      @endforeach
    </div>
  </div>
{{-- <div class="container">
    {{ $gallery->links() }}
</div> --}}
@endsection
