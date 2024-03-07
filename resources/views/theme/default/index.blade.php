@extends('theme.default.layouts.website')

@section('content')
{{-- $date_format = get_company_option('date_format','Y-m-d'); --}}


<!--====== Writing Text PART START ======-->

<section class="container mt-5">
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            @foreach($carusel as $key => $image)
                <div class="carousel-item {{ $key == 0 ? 'active' : '' }}">
                    <img src="{{ asset('public/uploads/carusel/'.$image->img) }}" class="d-block w-100" alt="Carousel Image">
                </div>
            @endforeach
        </div>
    </div>
</section>
<!-- Section 2: Post Card Design -->
<section class="container mt-5">
    <h2 class="text-center my-4">Job Circular</h2>

</section>

@php
        $date_format = get_company_option('date_format','Y-m-d');

        $counter = 0;
        @endphp
<div class="row m-auto py-4 container">
    <div class="col-sm-12 col-md-2">
        <ul class="nav flex-column nav-tabs settings-tab" role="tablist">
            <li class="my-2"><a class="nav-link btn btn-primary active" data-toggle="tab" href="#developer">{{ _lang('Web Developer') }}</a></li>
            <li class="my-2"><a class="nav-link btn btn-primary" data-toggle="tab" href="#graphic">{{ _lang('Graphic Design') }}</a></li>
            <li class="my-2"><a class="nav-link btn btn-primary" data-toggle="tab" href="#video">{{ _lang('Video Editor') }}</a></li>
            <li class="my-2"><a class="nav-link btn btn-primary" data-toggle="tab" href="#digital">{{ _lang('Digital Marketer') }}</a></li>
            <li class="my-2"><a class="nav-link btn btn-primary" data-toggle="tab" href="#others">{{ _lang('Others') }}</a></li>
        </ul>
    </div>

    <div class="col-sm-12 col-md-10">
        <div class="tab-content">
            <div id="developer" class="tab-pane active">
                <!-- Loop through blog posts -->
                @php
                $counter = 0;
                @endphp
                <div class="row">
                    @foreach ($blog as $data)
                        @if ($data->category == 1)
                        @if ($counter < 6)
                            <div class="col-md-4 col-sm-6">
                                <a href="{{ url('circular/view/'.$data->id) }}" class="card-link">
                                    <div class="card">
                                        <img src="{{ asset('public/uploads/blog/'.$data->blog_img ) }}" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">{!!strlen( $data->title)>20 ? substr($data->title,0,30)."[&hellip;]" : $data->title!!}</h5>
                                            <a href="{{ url('circular/view/'.$data->id) }}" class="btn btn-primary">Read More</a>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            @php
                            $counter++;
                        @endphp
                    @else
                        @break
                    @endif
                        @endif
                    @endforeach
                </div>
            </div>
            <div id="graphic" class="tab-pane ">
                <!-- Loop through blog posts -->
                @php
                $counter = 0;
                @endphp
                <div class="row">
                    @foreach ($blog as $data)
                        @if ($data->category == 2)
                        @if ($counter < 6)
                            <div class="col-md-4 col-sm-6">
                                <a href="{{ url('circular/view/'.$data->id) }}" class="card-link">
                                    <div class="card">
                                        <img src="{{ asset('public/uploads/blog/'.$data->blog_img ) }}" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">{!!strlen( $data->title)>20 ? substr($data->title,0,30)."[&hellip;]" : $data->title!!}</h5>
                                            <a href="{{ url('circular/view/'.$data->id) }}" class="btn btn-primary">Read More</a>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            @php
                            $counter++;
                        @endphp
                    @else
                        @break
                    @endif
                        @endif
                    @endforeach
                </div>
            </div>
            <div id="video" class="tab-pane">
                <!-- Loop through blog posts -->
                @php
                $counter = 0;
                @endphp
                <div class="row">
                    @foreach ($blog as $data)
                        @if ($data->category == 3)
                        @if ($counter < 6)
                            <div class="col-md-4 col-sm-6">
                                <a href="{{ url('circular/view/'.$data->id) }}" class="card-link">
                                    <div class="card">
                                        <img src="{{ asset('public/uploads/blog/'.$data->blog_img ) }}" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">{!!strlen( $data->title)>20 ? substr($data->title,0,30)."[&hellip;]" : $data->title!!}</h5>
                                            <a href="{{ url('circular/view/'.$data->id) }}" class="btn btn-primary">Read More</a>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            @php
                            $counter++;
                        @endphp
                    @else
                        @break
                    @endif
                        @endif
                    @endforeach
                </div>
            </div>
            <div id="digital" class="tab-pane">
                <!-- Loop through blog posts -->
                @php
                $counter = 0;
                @endphp
                <div class="row">
                    @foreach ($blog as $data)
                        @if ($data->category == 4)
                        @if ($counter < 6)
                            <div class="col-md-4 col-sm-6">
                                <a href="{{ url('circular/view/'.$data->id) }}" class="card-link">
                                    <div class="card">
                                        <img src="{{ asset('public/uploads/blog/'.$data->blog_img ) }}" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">{!!strlen( $data->title)>20 ? substr($data->title,0,30)."[&hellip;]" : $data->title!!}</h5>
                                            <a href="{{ url('circular/view/'.$data->id) }}" class="btn btn-primary">Read More</a>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            @php
                            $counter++;
                        @endphp
                    @else
                        @break
                    @endif
                        @endif
                    @endforeach
                </div>
            </div>
            <div id="others" class="tab-pane">
                <!-- Loop through blog posts -->
                @php
                $counter = 0;
                @endphp
                <div class="row">
                    @foreach ($blog as $data)
                        @if ($data->category == 5)
                        @if ($counter < 6)
                            <div class="col-md-4 col-sm-6">
                                <a href="{{ url('circular/view/'.$data->id) }}" class="card-link">
                                    <div class="card">
                                        <img src="{{ asset('public/uploads/blog/'.$data->blog_img ) }}" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">{!!strlen( $data->title)>20 ? substr($data->title,0,30)."[&hellip;]" : $data->title!!}</h5>
                                            <a href="{{ url('circular/view/'.$data->id) }}" class="btn btn-primary">Read More</a>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            @php
                            $counter++;
                        @endphp
                    @else
                        @break
                    @endif
                        @endif
                    @endforeach
                </div>
            </div>

        </div>
    </div>
</div>

<section class="container mt-5 ">
    <h2 class="text-center my-4">Blog Posts</h2>
    <div class="row">
        @php
        $date_format = get_company_option('date_format','Y-m-d');
        $counter = 0;
        @endphp
        @foreach ($Circular as $data )
        @if ($counter < 3)
                <!-- Display the blog post content here -->
                <div class="col-md-4 my-3">
                    <div class="card">
                        <a href="{{ url('post/view/'.$data->id) }}">
                        <img src="{{ asset('public/uploads/jobcircular/'.$data->img ) }}" style="width: 100%; height:190px;" class="card-img-top" alt="Post 1">
                        <div class="card-body">
                            <h5 class="card-title">{!!strlen( $data->title)>20 ? substr($data->title,0,30)."[&hellip;]" : $data->title!!}</h5>
                            <hp class="text-dark" style="text-decoration: none;">{!!strlen( $data->description)>20 ? substr($data->description,0,30)."[&hellip;]" : $data->description!!}</hp>
                            <div class="font-weight-bold d-flex">
                                <div class="">
                                    <h6 class="card-subtitle mt-3 text-muted"><small class="font-weight-bold">{{date($date_format,strtotime($data->created_at)) }}</small></h6>
                                </div>
                            </div>
                        </div>
                        </a>
                    </div>
                </div>

                @php
                    $counter++;
                @endphp
            @else
                @break
            @endif
        @endforeach
    </div>
</section>



{{-- <section>
    <h2 class="text-center my-5">Our Gallery</h2>
    <div class="container container-fluid" style="background-color: #f7ecd7;">
        <div class="gallery-container row">
            @php
            $counter = 0;
            @endphp
          @foreach ($gallery as $data)
          @if ($counter < 6)
          <div class="gallery-card">
            <img src="{{ asset('public/uploads/gallery/'.$data->gallery_img) }}" alt="">
            <div class="card-text">{{ $data->title }}</div>
          </div>
          @php
            $counter++;
           @endphp
            @else
                @break
            @endif
          @endforeach
        </div>
      </div>
</section> --}}

<!-- Section 3: About Us -->
            <section class="container mt-5">
                 <div class="col-lg-12">
                     <h2 class="text-center mb-5">About Us</h2>
                    <div class="row">
                        <div class="col-md-6 image">
                            <img src="{{ get_array_option('about_image') != '' ? asset('public/uploads/media/'.get_array_option('about_image')) : theme_asset('assets/images/about.png') }}" alt="features">
                        </div>
                        <div class="col-md-6">
                            <h4 class="my-3">Bangladesh handloom education and training Institute Alumni Association</h4>
                            <p>{!! xss_clean(get_array_option('about_content')) !!}</p>
                        </div>
                   </div>
                </div>
            </section>


            <!-- Section 5: Services -->
<div class="container mt-5">
    <h2 class="text-center mb-5 ">Our Services</h2>
    <div class="row">
        <!-- Service Card 1 -->
        @foreach ($items as $data)
        <div class="col-md-4">
            <div class="">
                <h6 class="mt-2 text-center card-subtitle text-muted"><img style="height:120px;width:120px;" src="{{ asset('public/uploads/service/'.$data->img) }}" class="profile-image  "></h6>
                {{-- <img src="{{ asset('public/uploads/service/'.$data->img) }}" class="" alt="Service 1 Image"> --}}
                <div class="card-body text-center">
                    <h5 class="card-title">{{ $data->name }}</h5>
                    <p class="card-text">{!!strlen( $data->description)>40 ? substr($data->description,0,240)."[&hellip;]" : $data->description !!}</p>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>



<!-- Section 4: Frequently Asked Questions -->
<section class="container">
    <section id="faq" class="general-area">
        <div class="container">
            <h2 class="text-center">Frequently Asked Questions</h2>
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title page text-left ">
                        <p>{!! xss_clean(get_array_option('about_content')) !!}</p>
                    </div> <!-- section title -->
                </div>

                <div class="col-lg-12">

                    <div class="row mt-5" id="accordion">

                        @foreach(\App\Faq::all()->sortBy('id') as $faq)
                        <div class="col-md-12">
                              <div class="card faq-box">
                                <div class="card-header">
                                  <a class="card-link" data-toggle="collapse" href="#collapse-{{ $faq->id }}">
                                  {{ get_array_data($faq->question) }}
                                  </a>
                                </div>
                                <div id="collapse-{{ $faq->id }}" class="collapse {{ $loop->first ? 'show' : '' }}" data-parent="#accordion">
                                  <div class="card-body">
                                    {!! (get_array_data($faq->answer)) !!}
                                  </div>
                                </div>
                              </div>
                        </div>
                        @endforeach

                    </div> <!-- row -->
                </div> <!-- row -->
            </div> <!-- row -->
        </div> <!-- conteiner -->
    </section>
</section>



{{--


<section id="">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="section-title">
                    <p class="text">{!! get_array_option('short_description') !!}</p>
                </div> <!-- section title -->
            </div>
        </div> <!-- row -->

    </div> <!-- conteiner -->
</section> --}}



<!--====== PRICING PART START ======-->
{{-- <section id="pricing" class="pricing-area">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section-title text-center pb-10">
                    <h4 class="title">{{ _lang('Our Pricing') }}</h4>
                    <p class="text">{{ _lang('Stop wasting time and take accurate attendance. Happiness guaranteed!') }}</p>
                </div> <!-- section title -->
            </div>
        </div> <!-- row -->

        <div class="row mt-4">
            <div class="col-md-12 text-center">
                <button class="btn btn-primary btn-xs" id="btn-monthly">{{ _lang('Monthly Plan') }}</button>
                <button class="btn btn-outline-info btn-xs" id="btn-yearly">{{ _lang('Yearly Plan') }}</button>
            </div>
        </div>


        <div class="row justify-content-center">
            @php $currency = currency(get_option('currency','USD')); @endphp

            @foreach(\App\Package::all() as $package)
                <div class="col-lg-4 col-md-7 col-sm-9 monthly-package">
                    <div class="single-pricing {{ $package->is_featured == 1 ? 'pro' : '' }} mt-40">

                        @if($package->is_featured )
                            <div class="pricing-baloon">
                                <img src="{{ asset('public/theme/default/assets/images/baloon.svg') }}" alt="baloon">
                            </div>
                        @endif

                        <div class="pricing-header {{ $package->is_featured == 1 ? '' : 'text-center' }}">
                            <h5 class="sub-title">{{ $package->package_name }}</h5>

                            <span class="price">{{ g_decimal_place($package->cost_per_month, $currency) }}</span>
                            <p class="year">{{ _lang('Per Month') }}</p>
                        </div>
                        <div class="pricing-list">
                            <ul>


                                <li><i class='lni {{ unserialize($package->contacts_limit)['monthly'] != 'No' ? 'lni-checkmark-circle' : 'lni-cross-circle' }}'></i>{{ _dlang(unserialize($package->contacts_limit)['monthly']).' '._lang('Students') }}</li>



                                <li><i class='lni {{ unserialize($package->sms_panel)['monthly'] == 'Yes'? 'lni-checkmark-circle' : 'lni-cross-circle' }}'></i>{{ _lang('SMS Panel') }}</li>
                                <hr>
                                @if (isset($package->description))
                                <p>{!! unserialize($package->description)['monthly']!!}</p>
                                @endif

                            </ul>
                        </div>
                        <div class="pricing-btn text-center">
                            <a class="main-btn" href="{{ url('sign_up?package_type=monthly&package='.$package->id) }}">{{ _lang('GET STARTED') }}</a>
                        </div>
                    </div> <!-- single pricing -->
                </div>



                <div class="col-lg-4 col-md-7 col-sm-9 yearly-package">
                    <div class="single-pricing {{ $package->is_featured == 1 ? 'pro' : '' }} mt-40">

                        @if($package->is_featured )
                            <div class="pricing-baloon">
                                <img src="{{ asset('public/theme/default/assets/images/baloon.svg') }}" alt="baloon">
                            </div>
                        @endif

                        <div class="pricing-header {{ $package->is_featured == 1 ? '' : 'text-center' }}">
                            <h5 class="sub-title">{{ $package->package_name }}</h5>

                            <span class="price">{{ g_decimal_place($package->cost_per_year, $currency) }}</span>
                            <p class="year">{{ _lang('Per Year') }}</p>
                        </div>
                        <div class="pricing-list">
                            <ul>


                                <li><i class='lni {{ unserialize($package->contacts_limit)['yearly'] != 'No' ? 'lni-checkmark-circle' : 'lni-cross-circle' }}'></i>{{ _dlang(unserialize($package->contacts_limit)['yearly']).' '._lang('Contacts') }}</li>

                                <li><i class='lni {{ unserialize($package->sms_panel)['yearly'] == 'Yes'? 'lni-checkmark-circle' : 'lni-cross-circle' }}'></i>{{ _lang('SMS Panel') }}</li>
                                <hr>
                                @if(isset($package->description))
                                <p>{!! unserialize($package->description)['yearly']!!}</p>
                                @endif

                            </ul>
                        </div>
                        <div class="pricing-btn text-center">
                            <a class="main-btn" href="{{ url('sign_up?package_type=yearly&package='.$package->id) }}">{{ _lang('GET STARTED') }}</a>
                        </div>
                    </div> <!-- single pricing -->
                </div>

            @endforeach

        </div> <!-- row -->
    </div> <!-- conteiner -->
</section> --}}

<!--====== PRICING PART ENDS ======-->

<!--====== Writing Text PART START ======-->
{{-- @if(!empty(get_array_option('short_description_bottom')))

<section id="pricing" class="pricing-area">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="section-title text-center">
                    <p class="text">{!! get_array_option('short_description_bottom') !!}</p>
                </div> <!-- section title -->
            </div>
        </div> <!-- row -->

    </div> <!-- conteiner -->
</section>

@endif --}}
<!--====== Writing Text PART START ======-->

 <!--====== CALL TO ACTION PART START ======-->

{{-- <section id="call-to-action" class="call-to-action">
    <div class="call-action-image">
        <img src="{{ asset('public/theme/default/assets/images/call-to-action.png') }}" alt="call-to-action">
    </div>

    <div class="container-fluid">
        <div class="row justify-content-end">
            <div class="col-lg-6">
                <div class="call-action-content text-center">
                    <h2 class="call-title">{{ _lang('Curious to Learn More? Stay Tuned') }}</h2>
                    <p class="text">{{ _lang('Stop wasting time and take accurate attendance. Happiness guaranteed!') }}</p>
                    <form action="{{ url('emaiL_subscribed') }}" method="post">
                        {{ csrf_field() }}
                        <div class="call-newsletter">
                            <i class="lni lni-envelope"></i>
                            <input type="email" name="email" placeholder="{{ _lang('yourmail@email.com') }}" required>
                            <button type="submit">{{ _lang('SUBSCRIBE') }}</button>
                        </div>
                    </form>
                </div> <!-- slider-content -->
            </div>
        </div> <!-- row -->
    </div> <!-- container -->
</section> --}}

<!--====== CALL TO ACTION PART ENDS ======-->

<!--====== CONTACT PART START ======-->

{{-- <section id="contact" class="contact-area">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section-title text-center pb-10">
                    <h4 class="title">{{ _lang('Get In touch') }}</h4>
                    <p class="text">{{ _lang('Stop wasting time and take accurate attendance. Happiness guaranteed!') }}</p>
                </div> <!-- section title -->
            </div>
        </div> <!-- row -->
        <div class="row justify-content-center">
            <div class="col-lg-8">

                <div class="alert alert-success d-none" id="contact-message"></div>

                <div class="contact-form">
                    <form id="contact-form" action="{{ url('contact/send_message') }}" method="post" data-toggle="validator">
                        {{ csrf_field() }}
                        <div class="row">
                            <div class="col-md-6">
                                <div class="single-form form-group">
                                    <input type="text" name="name" value="{{ old('name') }}" placeholder="{{ _lang('Your Name') }}" data-error="Name is required." required="required">
                                    <div class="help-block with-errors"></div>
                                </div> <!-- single form -->
                            </div>
                            <div class="col-md-6">
                                <div class="single-form form-group">
                                    <input type="email" name="email" value="{{ old('email') }}" placeholder="{{ _lang('Your Email') }}" data-error="Valid email is required." required="required">
                                    <div class="help-block with-errors"></div>
                                </div> <!-- single form -->
                            </div>
                            <div class="col-md-12">
                                <div class="single-form form-group">
                                    <input type="text" name="subject" value="{{ old('subject') }}" placeholder="{{ _lang('Subject') }}" data-error="Subject is required." required="required">
                                    <div class="help-block with-errors"></div>
                                </div> <!-- single form -->
                            </div>

                            <div class="col-md-12">
                                <div class="single-form form-group">
                                    <textarea placeholder="{{ _lang('Your Mesaage') }}" name="message" data-error="Please, leave us a message." required="required">{{ old('message') }}</textarea>
                                    <div class="help-block with-errors"></div>
                                </div> <!-- single form -->
                            </div>
                            <p class="form-message"></p>
                            <div class="col-md-12">
                                <div class="single-form form-group text-center">
                                    <button type="submit" class="main-btn">{{ _lang('send message') }}</button>
                                </div> <!-- single form -->
                            </div>
                        </div> <!-- row -->
                    </form>
                </div> <!-- row -->
            </div>
        </div> <!-- row -->
    </div> <!-- conteiner -->
</section> --}}

<!--====== CONTACT PART ENDS ======-->

@endsection
