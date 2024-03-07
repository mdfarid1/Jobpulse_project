

@extends('theme.default.layouts.website')

@section('header')
<div class="page-hero bg_cover" style="background-image: url({{ get_option('sub_banner_image') != '' ? asset('public/uploads/media/'.get_option('sub_banner_image')) : theme_asset('assets/images/header-bg.jpg') }})">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-8 col-lg-10">
				<div class="header-content text-center">
					<h3 class="header-title">{{ _lang('OUR BLOG') }}</h3>
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
<section class="mx-0 my-0 pt-2 pb-5" style="background-color: rgb(238, 221, 247);">
  <div class="container card">
    <div class="row justify-content-center my-3">
      @foreach ($category as $key=>$value)
      <div class="col-md-4 my-2 wow fadeInLeft slow">
        <div class="card ho" style="background-color: rgb(200, 247, 194);">
          <div class="card-body view overlay">
            <h4 class="card-title">{{ $value->category_name}}</h4>
            <p class="card-text">{{$value->category_description}}</p>
            <span class="text-wrap  text-dark"><small class="font-weight-bold">{{ date($date_format,strtotime($value->created_at)) }}</small></span><br>
            <a href="{{route('blog.category',$value->id)}}" style="background-color: rgb(69, 200, 218);" class="btn mt-2 btn-primary">{{ _lang('Read More') }}</a>
          </div>
        </div>
      </div>
      @endforeach
    </div>
  </div>

</section>
@endsection
