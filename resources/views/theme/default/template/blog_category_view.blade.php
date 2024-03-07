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

          <div class="card mt-3" style="box-shadow: 0 0 10px black;">
            <div class="card-body mx-3">
                <div class=" m-auto">
                  <img  src="{{ asset('public/uploads/blog/'.$blog->blog_img) }}" class="img-fluid rounded-start" alt="...">
                </div>
              <h3 class="card-title mt-3">{{ $blog->title }}</h3>
              <div class="font-weight-bold d-flex">
                <div>
                    <h6 class="card-subtitle mt-3 text-muted"><small class="font-weight-bold mx-3">{{ $blog->category_name }}</small><i class="fa-solid mx-3 fa-medal " style="color: rgb(217, 172, 23);"></i></h6>
                </div>
                <div class="">
                    <h6 class="card-subtitle mt-3 text-muted"><small class="font-weight-bold">{{date($date_format,strtotime($blog->created_at)) }}</small></h6>
                </div>
            </div>


            <div class="my-3">
                @if(Auth::check() && Auth::user('client'))
                <div>
                    <a href="{{ url('apply/create',$blog->id) }}">
                        <div class="d-grid gap-2">
                            <button class="btn btn-primary btn-lg" type="button">Apply</button>
                        </div>
                    </a>
                </div>
            @else

            <div class="text-end">
                <a href="{{ url('register/candidate_signup') }}"><div class="d-grid gap-2">
                    <button class="btn btn-primary btn-lg" type="button">Apply</button>
                </div></a>
            </div>
            @endif
            </div>
              <p class="card-text"> {!! $blog->description !!} </p>
            </div>
            </div>
          </div>


                  </div>
                </div>
              </div>
          </div>
        </div>
       </div>
    </div>

</div>


    <div class="container m-auto ">
        <h5 class="my-4">Related Posts</h5>
        <div class="col-md-12 row">
            <!-- Blog Post 1 -->
            {{-- @foreach ($posts as $data ) --}}
            @if(isset($prev))
            <div class="col-md-6 m-auto" >
                <div class="blog-post card"  style="box-shadow: 0 0 10px black; width: 30rem;">
                    <a href="{{url('circular/view/'.$prev->id)}}">
                        <img src="{{ asset('public/uploads/blog/'.$prev->blog_img) }}"alt="Blog Image" class="blog-img">
                <h5 class="card-title mt-3">{!!strlen( $prev->title)>20 ? substr($prev->title,0,30)."[&hellip;]" : $prev->title!!}</h5>
                    </a>
                    <div class="font-weight-bold d-flex">

                        <div>
                            <h6 class="card-subtitle m-3 text-muted"><small class="font-weight-bold">{{ $blog->category_name}}</small><i class="fa-solid mx-3 fa-medal " style="color: rgb(217, 172, 23);"></i></h6>
                        </div>
                        <div class="">
                            <h6 class="card-subtitle mt-3 text-muted"><small class="font-weight-bold">{{date($date_format,strtotime($blog->created_at)) }}</small></h6>
                        </div>
                    </div>
                </div>
            </div>
            @endif
            @if(isset($next))
                <div class="col-md-6" >
                    <div class="blog-post" style="box-shadow: 0 0 10px black; width: 30rem;">
                        <a href="{{url('circular/view/'.$next->id)}}">
                            <img src="{{ asset('public/uploads/blog/'.$next->blog_img) }}" alt="Blog Image" class="blog-img">
                            <h5 class="card-title mt-3">{!!strlen( $next->title)>20 ? substr($next->title,0,30)."[&hellip;]" : $next->title!!}</h5>
                        </a>
                        <div class="font-weight-bold d-flex">

                            <div>
                                <h6 class="card-subtitle m-3 text-muted"><small class="font-weight-bold">{{ $blog->category_name }}</small><i class="fa-solid mx-3 fa-medal " style="color: rgb(217, 172, 23);"></i></h6>
                            </div>
                            <div class="">
                                <h6 class="card-subtitle mt-3 text-muted"><small class="font-weight-bold">{{date($date_format,strtotime($blog->created_at)) }}</small></h6>
                            </div>

                        </div>
                    </div>
                </div>


            @endif
        </div>
    </div>
</section>
@endsection
