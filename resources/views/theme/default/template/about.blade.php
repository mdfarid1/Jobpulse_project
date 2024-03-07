@extends('theme.default.layouts.website')

@section('header')
<div class="page-hero bg_cover" style="background-image: url({{ get_option('sub_banner_image') != '' ? asset('public/uploads/media/'.get_option('sub_banner_image')) : theme_asset('assets/images/header-bg.jpg') }})">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-8 col-lg-10">
				<div class="header-content text-center">
					<h3 class="header-title">{{ _lang('About BHETIAA') }}</h3>
				</div> <!-- header content -->
			</div>
		</div> <!-- row -->
	</div> <!-- container -->
</div> <!-- header content -->
@endsection

@section('content')


<section id="about" class="general-area">
	<div class="container">
	     <div class="row">
			<div class="col-lg-12">
				<div class="section-title page text-left">
					<p>{!! xss_clean(get_array_option('about_content')) !!}</p>
				</div>
			</div>
		</div>
        <div class=" m-auto image">
            <img class="m-auto " src="{{ get_array_option('about_image') != '' ? asset('public/uploads/media/'.get_array_option('about_image')) : theme_asset('assets/images/about.png') }}" alt="features">
        </div>
	</div>
{{--
	<div class="about-image d-lg-flex align-items-center">
	<div class="image">
		<img src="{{ get_array_option('about_image') != '' ? asset('public/uploads/media/'.get_array_option('about_image')) : theme_asset('assets/images/about.png') }}" alt="features">
	</div>
</div> --}}
</section>



@endsection
