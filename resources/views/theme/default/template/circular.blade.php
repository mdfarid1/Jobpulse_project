@extends('theme.default.layouts.website')

@section('header')
<div class="page-hero bg_cover" style="background-image: url({{ get_option('sub_banner_image') != '' ? asset('public/uploads/media/'.get_option('sub_banner_image')) : theme_asset('assets/images/header-bg.jpg') }})">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-8 col-lg-10">
				<div class="header-content text-center">
					<h3 class="header-title">{{ _lang('Our Blogs') }}</h3>
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
<div class="container">
    <h3 class="my-4">Blogs List</h3>

    <div class="row">
        <!-- Blog Post 1 -->
        @foreach ($Circular as $data )
        <div class="col-md-4" >
            <div class="blog-post" >
                <a href="{{ url('post/view/'.$data->id) }}">
                    <img src="{{ asset('public/uploads/jobcircular/'.$data->img) }}" style="width: 100%; height:200px;" alt="Blog Image" class="blog-img">
                <h5 class="mt-3 pb-2">{{ $data->title }}</h5>
                <h5 class="card-title mt-3">{!!strlen( $data->description)>30 ? substr($data->description,0,30)."[&hellip;]" : $data->description!!}</h5>
                </a>
                <div class="font-weight-bold d-flex">

                    <div class="">
                        <h6 class="card-subtitle mt-3 text-muted"><small class="font-weight-bold">{{date($date_format,strtotime($data->created_at)) }}</small></h6>
                    </div>
                </div>
            </div>
        </div>
        @endforeach
        <br>
    </div>
</div>
<div class="container">
    {{ $Circular->links() }}
</div>
@endsection




