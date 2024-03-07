@extends('theme.default.layouts.website')

@section('header')
<div class="page-hero bg_cover" style="background-image: url({{ get_option('sub_banner_image') != '' ? asset('public/uploads/media/'.get_option('sub_banner_image')) : theme_asset('assets/images/header-bg.jpg') }})">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-8 col-lg-10">
				<div class="header-content text-center">
					<h3 class="header-title">{{ $user->name  }}{{ _lang(' Profile') }}</h3>
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
            <div class="text-center">
                <img src="{{ asset('public/uploads/profile/'.$user->profile_picture) }}"style=" height:250px;width:250px;border-radius: 400px" alt="Profile Image" >
            <h5 class="text-center my-4"><strong>Bio:</strong> {{ $user->bio  }}</h5>
            </div>
    <div class=" col-md-12 row">
            <div class="col-md-6 m-auto">
                <div class="card mb-4" style="box-shadow: 0 0 10px black;">
                    <img src="{{ asset('public/uploads/profile/'.$user->profile_picture) }}" class="img-fluid">
                </div>
            </div>
            <div class="col-md-6">
                <div class="card table-responsive m-auto" style="box-shadow: 0 0 10px black; ">

                    <table class="table text-center mt-5 table-striped table-hover">
                        <tbody>
                        <tr>
                            <td>Name</td>
                            <td>{{ $user->name  }}</td>
                        </tr>
                        <tr>
                            <td>Email</strong></td>
                            <td>{{ $user->email  }}</td>
                        </tr>
                        <tr>
                            <td>Phone</strong></td>
                            <td>{{ $user->mobile  }}</td>
                        </tr>
                        <tr>
                            <td>Profession</td>
                            <td>{{ $user->company->business_name  }}</td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td>{{ $user->address  }}</td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="social-icons text-center mb-3">

                        <a href="{{ $user->facebook  }}" target="_blank"><i class="fab fa-facebook"></i></a>
                        <a href="{{ $user->linkedin  }}" target="_blank"><i class="fab fa-twitter"></i></a>
                        <a href="{{ $user->instragram  }}" target="_blank"><i class="fab fa-linkedin"></i></a>
                        <a href="{{ $user->tiktok  }}" target="_blank"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
       </div>
</div>
@endsection
