@extends('theme.default.layouts.website')

@section('header')
<div class="page-hero bg_cover" style="background-image: url({{ get_option('sub_banner_image') != '' ? asset('public/uploads/media/'.get_option('sub_banner_image')) : theme_asset('assets/images/header-bg.jpg') }})">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-8 col-lg-10">
				<div class="header-content text-center">
					<h3 class="header-title">{{ _lang('Job Circular') }}</h3>
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
    <h3 class="my-4">Job Circular</h3>

    <div class="row">
        <!-- Blog Post 1 -->
        @foreach ($posts as $data )
        @if ($data->status == 2)
        <div class="col-md-4" >
            <div class="blog-post"  style="box-shadow: 0 0 10px black;">
                <a href="{{ url('circular/view/'.$data->id) }}">
                    <img src="{{ asset('public/uploads/blog/'.$data->blog_img) }}" style="width: 100%; height:190px;" alt="Blog Image" class="blog-img">
                {{-- <h5 class="mt-3 pb-2">{{ $data->title }}</h5> --}}
                <h5 class="card-title mt-3">{!!strlen( $data->title)>20 ? substr($data->title,0,30)."[&hellip;]" : $data->title!!}</h5>
                </a>
                <div class="font-weight-bold d-flex">
                    {{-- <div>
                        <h6 class="mt-2 card-subtitle text-muted"><img style="height:40px;width:40px;" src="{{ asset('public/uploads/profile/'.$data->user->profile_picture) }}" class="profile-image "></h6>

                    </div> --}}
                    <div>
                        <h6 class="card-subtitle mt-3 text-muted"><small class="font-weight-bold mx-3">{{ $data->category_name }}</small><i class="fa-solid mx-1 fa-medal " style="color: rgb(217, 172, 23);"></i></h6>
                    </div>
                    <div class="">
                        <h6 class="card-subtitle mt-3 text-muted"><small class="font-weight-bold">{{date($date_format,strtotime($data->created_at)) }}</small></h6>
                    </div>
                </div>
            </div>
        </div>
       @endif
        @endforeach
        <br>
    </div>
</div>
<div class="container">
    {{ $posts->links() }}
</div>
@endsection




