@extends('theme.default.layouts.website')

@section('header')
<div class="page-hero bg_cover" style="background-image: url({{ get_option('sub_banner_image') != '' ? asset('public/uploads/media/'.get_option('sub_banner_image')) : theme_asset('assets/images/header-bg.jpg') }})">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-8 col-lg-10">
				<div class="header-content text-center">
					<h3 class="header-title">{{ _lang('Our Blog') }}</h3>
				</div> <!-- header content -->
			</div>
		</div> <!-- row -->
	</div> <!-- container -->
</div> <!-- header content -->
@endsection

@section('content')

@php
$currency = currency();
$base_currency = base_currency();
$date_format = get_company_option('date_format','Y-m-d');
@endphp

<section>
    <div class="container">
       <div class="col-md-12 row">
        <div class="col-md-12">

          <div class="card mt-3">
            <div class="card-body mx-3">
                <div class=" m-auto">
                  <img  src="{{ asset('public/uploads/jobcircular/'.$Circular->img) }}" style="height:600px;width:100%;" class="img-fluid rounded-start" alt="...">
                </div>
              <h3 class="card-title mt-3">{{ $Circular->title }}</h3>
              <div class="font-weight-bold d-flex">
                <div class="">
                    <h6 class="card-subtitle mt-3 text-muted"><small class="font-weight-bold">{{date($date_format,strtotime($Circular->created_at)) }}</small></h6>
                </div>
            </div>
              <p class="card-text"> {!! $Circular->description !!} </p>
              </div>
            </div>
          </div>
        </div>
    </div>
</section>
@endsection
