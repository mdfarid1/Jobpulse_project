<!doctype html>
<html lang="en">

<head>
    <!--====== Required meta tags ======-->
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<!--====== Title ======-->
    <title>JobPulse</title>

    <meta name="keywords" content="{{ get_option('meta_keywords') }}"/>
    <meta name="description" content="{{ get_option('meta_description') }}"/>

    <meta name="og:title" content="{{ get_array_option('hero_title') }}"/>
    <meta name="og:type" content="website"/>
    <meta name="og:url" content="{{ url('') }}"/>
    <meta name="og:image" content="{{ asset('images/meta-image.png') }}"/>
    <meta name="og:site_name" content="{{ get_option('website_title','ElitKit') }}"/>
    <meta name="og:description" content="{{ get_option('meta_description') }}"/>
    <link href="{{ asset('public/backend/plugins/datatables/dataTables.bootstrap4.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('public/backend/plugins/datatables/buttons.bootstrap4.min.css') }}" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Responsive datatable examples -->
    <link href="{{ asset('public/backend/plugins/datatables/responsive.bootstrap4.min.css') }}" rel="stylesheet" type="text/css" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="{{ get_favicon() }}">

    <!-- ======= Captcha ======== -->
    <link href="{{ captcha_layout_stylesheet_url() }}" type="text/css" rel="stylesheet">
    <!--====== Bootstrap css ======-->
    <link rel="stylesheet" href="{{ asset('public/theme/default/assets/css/bootstrap.min.css') }}">

    <!--====== Line Icons css ======-->
    <link rel="stylesheet" href="{{ asset('public/theme/default/assets/css/LineIcons.css') }}">

    <!--====== Magnific Popup css ======-->
    <link rel="stylesheet" href="{{ asset('public/theme/default/assets/css/magnific-popup.css') }}">

    <!--====== Toastr css ======-->
    <link rel="stylesheet" href="{{ asset('public/theme/default/assets/css/toastr.css') }}">

    <!--====== Default css ======-->
    <link rel="stylesheet" href="{{ asset('public/theme/default/assets/css/default.css') }}">

    <!--====== Style css ======-->
    <link rel="stylesheet" href="{{ asset('public/theme/default/assets/css/style.css?v=1.4') }}">

    <link href="{{ asset('public/backend/plugins/select2/select2.min.css') }}" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    {{-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> --}}
    <!--- Custom CSS Code --->
    <style type="text/css">
        {!! xss_clean(get_option('custom_css_code')) !!}

        .ho:hover{
            text-shadow: none !important;
            box-sizing: border-box !important;
            cursor: pointer !important;
            transition: all 0.3s ease !important;
            -webkit-transform: scale(1.1) !important;
            -ms-transform: scale(1.1) !important;
            transform: scale(1.1) !important;
            z-index: 2;
        }
    </style>
    <style>
        /* body {
            background: linear-gradient(to right, #4e54c8, #8f94fb);
            color: #fff;
            padding: 20px;
        } */

        body {
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }

        .blog-post {
            margin-bottom: 30px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .blog-img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .profile-card {
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            margin-bottom: 20px;
            padding: 20px;
        }

        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .profile-card {
            max-width:800px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }

        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
        }


    .gallery-container {
      display: flex;
      margin: auto;
      flex-wrap: wrap;
      justify-content: space-around;
      padding: 20px;
    }

    .gallery-card {
      position: relative;
      overflow: hidden;
      margin: 10px;
      width: 300px;
      height: 300px;
      border-radius: 15px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease-in-out;
    }

    .gallery-card img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .gallery-card:hover {
      transform: scale(1.05);
    }

    .gallery-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgba(0, 0, 0, 0.3);
      z-index: 1;
      opacity: 0;
      transition: opacity 0.3s ease-in-out;
      border-radius: 15px;
    }

    .gallery-card:hover::before {
      opacity: 1;
    }

    .gallery-card .card-text {
      position: absolute;
      bottom: 20px;
      left: 20px;
      color: #fff;
      z-index: 2;
    }
    .card-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.card {
    flex: 0 1 calc(25% - 20px); /* Adjust for margin */
    /* margin: 10px; */
    position: relative;
    overflow: hidden;
}

.card img {
    width: 100%;
    height: auto;
}

.card-content {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    background-color: rgba(203, 254, 254, 0.7);
    color: #fff;
    padding: 10px;
    box-sizing: border-box;
    transform: translateY(100%);
    transition: transform 0.3s ease;
}

.card:hover .card-content {
    transform: translateY(0);
}

.card-title,
.card-name {
    margin: 0;
}

.card-name {
    font-size: 14px;
}

@media screen and (max-width: 768px) {
    .card {
        flex-basis: calc(50% - 20px); /* Adjust for margin */
    }
}

@media screen and (max-width: 480px) {
    .card {
        flex-basis: calc(100% - 20px); /* Adjust for margin */
    }
}


    </style>

</head>

<body>

    <!--====== HEADER PART START ======-->

    <header class="header-area">
        <div class="navgition navgition-transparent">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg">
                            <a class="navbar-brand" href="{{ url('/') }}">
                                <img src="{{ get_logo() }}" class="logo" alt="Logo">
                            </a>

                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarOne" aria-controls="navbarOne" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse sub-menu-bar" id="navbarOne">

                                @if(Request::is('/'))
                                    <ul class="navbar-nav m-auto">
                                        <li class="nav-item active">
                                            <a class="page-scroll" href="{{ url('/') }}">{{ _lang('HOME') }}</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="page-scroll" href="{{ url('/post') }}">{{ _lang('BLOG') }}</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="page-scroll" href="{{ url('/circular') }}">{{ _lang('Circular') }}</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="page-scroll" href="{{ url('/member') }}">{{ _lang('Member') }}</a>
                                        </li>
                                        {{-- <li class="nav-item">
                                            <a class="page-scroll" href="{{ url('/gallery') }}">{{ _lang('Gallery') }}</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="page-scroll" href="{{ url('/director') }}">{{ _lang('Director List') }}</a>
                                        </li> --}}
                                        <li class="nav-item">
                                            <a class="page-scroll" href="{{ url('site/about') }}">{{ _lang('About') }}</a>
                                        </li>

                                        <li class="nav-item">
                                            <a class="page-scroll" href="{{ url('site/contact') }}">{{ _lang('Contact') }}</a>
                                        </li>

                                    </ul>
                                @else
                                <ul class="navbar-nav m-auto">
                                    <li class="nav-item  ">
                                        <a class="page-scroll" href="{{ url('/') }}">{{ _lang('HOME') }}</a>
                                    </li>
                                    <li class="nav-item {{ Request::is('/post') ? 'active' : '' }}">
                                        <a class="page-scroll" href="{{ url('/post') }}">{{ _lang('BLOG') }}</a>
                                    </li>
                                    <li class="nav-item {{  url()->current()==url('/circular') ? 'active' : '' }}">
                                        <a class="page-scroll" href="{{ url('/circular') }}">{{ _lang('Circular') }}</a>
                                    </li>
                                    <li class="nav-item {{  url()->current()==url('/member') ? 'active' : '' }}">
                                        <a class="page-scroll" href="{{ url('/member') }}">{{ _lang('Member') }}</a>
                                    </li>
                                    {{-- <li class="nav-item {{  url()->current()==url('/gallery') ? 'active' : '' }}">
                                        <a class="page-scroll" href="{{ url('/gallery') }}">{{ _lang('Gallery') }}</a>
                                    </li>
                                    <li class="nav-item {{  url()->current()==url('/director') ? 'active' : '' }}">
                                        <a class="page-scroll" href="{{ url('/director') }}">{{ _lang('Director List') }}</a>
                                    </li> --}}
                                    <li class="nav-item {{ Request::is('site/about') ? 'active' : '' }}">
                                        <a class="page-scroll" href="{{ url('site/about') }}">{{ _lang('About') }}</a>
                                    </li>

                                    {{-- <li class="nav-item {{ Request::is('site/faq') ? 'active' : '' }}">
                                        <a class="page-scroll" href="{{ url('site/faq') }}">{{ _lang('FAQ') }}</a>
                                    </li> --}}


                                    {{-- <li class="nav-item">
                                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Company</a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item text-center" href="{{ url('site/about') }}">About</a></li>
                                                <li><a class="dropdown-item text-center" href="{{ url('site/faq') }}">FAQ</a></li>
                                                <li><a class="dropdown-item text-center" href="{{ url('site/terms_condition') }}">Terms & Conditions</a></li>
                                            </ul>
                                    </li> --}}
                                    <li class="nav-item {{ Request::is('site/contact') ? 'active' : '' }}">
                                        <a class="page-scroll" href="{{ url('site/contact') }}">{{ _lang('Contact') }}</a>
                                    </li>
                                </ul>
                                @endif


								<ul class="navbar-nav m-auto auth-nav">
                                    @if(! Auth::check())
                                    <li class="nav-item">
                                        <a class="sing-in-btn" href="{{ url('login') }}">{{ _lang('Candidate SIGN IN') }}</a>
                                    </li>
                                    @endif

                                    @if(! Auth::check())
                                        <li class="nav-item">
                                            <a class="sing-in-btn" href="{{ url('login') }}">{{ _lang('SIGN IN') }}</a>
                                        </li>
										@if(get_option('allow_singup','yes') == 'yes')
											<li class="nav-item">
												<a class="sing-up-btn" href="{{ url('sign_up') }}">{{ _lang('SIGN UP') }}</a>
											</li>
										@endif
                                    @else
                                        @if (Auth::user()->status==0)
                                        <li class="nav-item">
                                            <a class="sing-in-btn" href="#">{{ _lang('Trial Version') }}</a>
                                            <a class="sing-in-btn" href="{{ url('logout') }}"><i class='lni lni-exit'></i>&nbsp;{{ _lang('SIGN OUT') }}</a>
                                        </li>
                                        @else
                                        <li class="nav-item">
                                            <a class="sing-up-btn" href="{{ url('admin/dashboard') }}"><i class='lni lni-dashboard'></i>&nbsp;{{ _lang('Dashboard') }}</a>
                                            {{-- <a class="sing-up-btn" href="{{ url('/profile/edit') }}"><i class='lni lni-dashboard'></i>&nbsp;{{ _lang('Profile') }}</a> --}}
                                            <a class="sing-in-btn" href="{{ url('logout') }}"><i class='lni lni-exit'></i>&nbsp;{{ _lang('SIGN OUT') }}</a>
                                        </li>
                                        @endif


                                    @endif

									{{-- @if(get_option('website_language_dropdown','yes') == 'yes')
										<div class="language-picker">
											<div class="dropdown">
											  <button class="btn btn-outline-primary dropdown-toggle" type="button" id="select_language" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											  {{ session('language') =='' ? get_option('language') : session('language') }}
											  </button>
											  <div class="dropdown-menu" aria-labelledby="select_language">
												@foreach(get_language_list() as $language)
													<a class="dropdown-item" href="?language={{ $language }}">{{ $language }}</a>
												@endforeach
											  </div>
											</div>
										</div>
									@endif --}}
                                </ul>

                            </div>

                        </nav> <!-- navbar -->
                    </div>
                </div> <!-- row -->
            </div> <!-- container -->
        </div> <!-- navgition -->

        @if(Request::is('/'))
        {{-- @section('header') --}}
        <div>
            <div class="header-hero">
                <div class="container">
                    <div class="justify-content-center">
                        <div class="col-md-12">
                            <div class="header-content text-center">
                                <h3 class="header-title">{{ get_array_option('hero_title') }}</h3>
                                <p class="text">{{ get_array_option('hero_sub_title') }}</p>
                                <ul class="header-btn">
                                    @if(get_option('trial_period') != 0)

                                        <li><a class="main-btn btn-one" href="{{ Auth::check() ? url('/') : url('sign_up') }}">{{ _lang('Get Started') }}</a></li>
                                    @endif

                                    @if(get_option('promo_video_url') != '')
                                        <li><a class="main-btn btn-two video-popup" href="{{ get_option('promo_video_url') }}">{{ _lang('WATCH THE VIDEO') }} <i class="lni lni-play"></i></a></li>
                                    @endif
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            {{-- <div id="" class="header-hero bg_cover" style="background-image: url({{ get_array_option('home_banner_image') != '' ? asset('public/uploads/media/'.get_array_option('home_banner_image')) : theme_asset('assets/images/header-bg.jpg') }})">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-10">
                            <div class="header-content text-center">

                                <h3 class="header-title">{{ get_array_option('hero_title') }}</h3>
                                <p class="text">{{ get_array_option('hero_sub_title') }}</p>
                                <ul class="header-btn">
                                    @if(get_option('trial_period') != 0)

										<li><a class="main-btn btn-one" href="{{ Auth::check() ? url('/') : url('sign_up') }}">{{ _lang('Get Started') }}</a></li>
									@endif

                                    @if(get_option('promo_video_url') != '')
                                        <li><a class="main-btn btn-two video-popup" href="{{ get_option('promo_video_url') }}">{{ _lang('WATCH THE VIDEO') }} <i class="lni lni-play"></i></a></li>
                                    @endif
                                </ul>
                            </div>
                        </div>
                    </div>
                </div> <
                <div class="header-shape">
                    <img src="{{ asset('public/theme/default/assets/images/header-shape.svg') }}" alt="shape">
                </div>
            </div> --}}
        @else
            @yield('header')
        @endif
    </header>


    <!--====== HEADER PART ENDS ======-->

    @yield('content')

    <!--====== FOOTER PART START ======-->

    <footer id="footer" class="footer-area">
        <div class="footer-widget">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer-logo-support d-md-flex align-items-end justify-content-between">
                            <div class="footer-logo d-flex align-items-end">
                                <a class="mt-30" href="{{ url('') }}"><img src="{{ get_logo() }}" alt="Logo"></a>

								@php
									$facebook_link = get_option('facebook_link');
									$twitter_link = get_option('twitter_link');
									$instagram_link = get_option('instagram_link');
									$linkedin_link = get_option('linkedin_link');
								@endphp

                                <ul class="social mt-30">
                                    @if($facebook_link)
										<li><a href="{{ $facebook_link }}"><i class="lni lni-facebook-filled"></i></a></li>
                                    @endif

									@if($twitter_link)
										<li><a href="{{ $twitter_link }}"><i class="lni lni-twitter-original"></i></a></li>
                                    @endif

									@if($instagram_link)
										<li><a href="{{ $instagram_link }}"><i class="lni lni-instagram-original"></i></a></li>
                                    @endif

									@if($linkedin_link)
										<li><a href="{{ $linkedin_link }}"><i class="lni lni-linkedin-original"></i></a></li>
                                    @endif
								</ul>
                            </div> <!-- footer logo -->

                        </div> <!-- footer logo support -->
                    </div>
                </div> <!-- row -->
                <div class="row">
                    <div class="col-lg-2 col-md-4 col-sm-6">
                        <div class="footer-link">
                            <h6 class="footer-title">{{ _lang('JobPulse') }}</h6>
                            <ul>
                                <li><a href="{{ url('/') }}">{{ _lang('Home') }}</a></li>
                                <li><a href="{{ url('/post') }}">{{ _lang('Blogs') }}</a></li>
                                <li><a href="{{ url('/member') }}">{{ _lang('Members') }}</a></li>
                            </ul>
                        </div> <!-- footer link -->
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="footer-link">
                            <h6 class="footer-title">{{ _lang('Company') }}</h6>
                            <ul>
                                <li><a href="{{ url('site/contact') }}">{{ _lang('Contact Us') }}</a></li>
                                <li><a href="{{ url('site/about') }}">{{ _lang('About US') }}</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-5">
                        <div class="footer-link">
                            <h6 class="footer-title">{{ _lang('Help & Suuport') }}</h6>
                            <ul>
                                <li><a href="{{ url('site/faq') }}">{{ _lang('FAQ') }}</a></li>
                                <li><a href="{{ url('site/terms_condition') }}">{{ _lang('Terms & Conditions') }}</a></li>
                            </ul>
                        </div> <!-- footer link -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-7">
                        <div class="footer-newsletter">
                            <h6 class="footer-title">{{ _lang('Subscribe Newsletter') }}</h6>
                            <div class="newsletter">
                                <form action="{{ url('emaiL_subscribed') }}" method="post">
                                    {{ csrf_field() }}
                                    <input type="email" name="email" placeholder="{{ _lang('Your Email') }}" required>
                                    <button type="submit"><i class="lni lni-angle-double-right"></i></button>
                                </form>
                            </div>
                            <p class="text">{{ _lang('Subscribe weekly newsletter to stay upto date. We do not send spam') }}.</p>
                        </div> <!-- footer newsletter -->
                    </div>
                </div> <!-- row -->
            </div> <!-- container -->
        </div> <!-- footer widget -->

        <div class="footer-copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright text-center">
                            <p class="text">{!! get_array_option('website_copyright','','Design & Developed by TrickyCode') !!}</p>
                        </div>
                    </div>
                </div> <!-- row -->
            </div> <!-- container -->
        </div> <!-- footer copyright -->
    </footer>

    <!--====== FOOTER PART ENDS ======-->

    <!--====== BACK TO TOP PART START ======-->

    <a class="back-to-top" href="#"><i class="lni lni-chevron-up"></i></a>

    <!--====== BACK TO TOP PART ENDS ======-->



    <!--====== jquery js ======-->
    <script src="{{ asset('public/theme/default/assets/js/vendor/modernizr-3.6.0.min.js') }}"></script>
    <script src="{{ asset('public/theme/default/assets/js/vendor/jquery-1.12.4.min.js') }}"></script>

    <!--====== Bootstrap js ======-->
    <script src="{{ asset('public/theme/default/assets/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('public/theme/default/assets/js/popper.min.js') }}"></script>
    <script src="{{ asset('public/backend/plugins/select2/select2.min.js') }}"></script>

    <!--====== Scrolling Nav js ======-->
    <script src="{{ asset('public/theme/default/assets/js/jquery.easing.min.js') }}"></script>
    <script src="{{ asset('public/theme/default/assets/js/scrolling-nav.js') }}"></script>

    <!--====== Magnific Popup js ======-->
    <script src="{{ asset('public/theme/default/assets/js/jquery.magnific-popup.min.js') }}"></script>

    <!--====== Tostr js ======-->
    <script src="{{ asset('public/theme/default/assets/js/toastr.js') }}"></script>

    <!--====== Main js ======-->
    <script src="{{ asset('public/theme/default/assets/js/main.js') }}"></script>
    {{-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Required datatable js -->
        <script src="{{ asset('public/backend/plugins/datatables/jquery.dataTables.min.js') }}"></script>
        <script src="{{ asset('public/backend/plugins/datatables/dataTables.bootstrap4.min.js') }}"></script>
        <!-- datatable Buttons -->
        <script src="{{ asset('public/backend/plugins/datatables/dataTables.buttons.min.js') }}"></script>
        <script src="{{ asset('public/backend/plugins/datatables/buttons.bootstrap4.min.js') }}"></script>
        <script src="{{ asset('public/backend/plugins/datatables/jszip.min.js') }}"></script>
        <script src="{{ asset('public/backend/plugins/datatables/pdfmake.min.js') }}"></script>
        <script src="{{ asset('public/backend/plugins/datatables/vfs_fonts.js') }}"></script>
        <script src="{{ asset('public/backend/plugins/datatables/buttons.html5.min.js') }}"></script>
        <script src="{{ asset('public/backend/plugins/datatables/buttons.print.min.js') }}"></script>
        <script src="{{ asset('public/backend/plugins/datatables/buttons.colVis.min.js') }}"></script>
        <!-- Responsive datatable -->
        <script src="{{ asset('public/backend/plugins/datatables/dataTables.responsive.min.js') }}"></script>
        <script src="{{ asset('public/backend/plugins/datatables/responsive.bootstrap4.min.js') }}"></script>
    <script type="text/javascript">
        (function($){
			"use strict";

            // Show Success Message
            @if(Session::has('success'))
               Command: toastr["success"](" {{ session('success') }} ")
            @endif

            // Show Single Error Message
            @if(Session::has('error'))
               Command: toastr["error"]("{{ session('error') }}")
            @endif

            @foreach ($errors->all() as $error)
                Command: toastr["error"]("{{ $error }}");
            @endforeach

        })(jQuery); <!-- End jQuery -->

        @if(! Request::is('/'))
		  document.title = $(".header-title").html() + ' | ' + document.title;
        @endif

        // $ (document).ready(function(){
        //     new WOW().init();
        // });
    </script>

     <!-- Custom JS -->
     @yield('js-script')

</body>

</html>
