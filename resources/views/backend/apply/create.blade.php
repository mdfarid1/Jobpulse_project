@extends('theme.default.layouts.website')

@section('header')
<div class="page-hero bg_cover" style="background-image: url({{ get_option('sub_banner_image') != '' ? asset('public/uploads/media/'.get_option('sub_banner_image')) : theme_asset('assets/images/header-bg.jpg') }})">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-8 col-lg-10">
				<div class="header-content text-center">
					<h3 class="header-title">{{ _lang('Apply Job') }}</h3>
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
<div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-header bg-info text-white">
            <h4 class="text-center">Job Apply Information</h4>
          </div>
          <div class="card-body">
            <form id="" action="{{ url('apply/store',$blog->user_id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="company_id" value="{{ Auth::user()->id }}">
                <input type="hidden" name="blog_id" value="{{$blog->id}}">

              <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your full name" required>
              </div>
              <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email address" required>
              </div>
              <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter your phone number">
              </div>
              <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" class="form-control" id="dob" name="dob">
              </div>
              <div class="form-group">
                <label for="bio">Bio</label>
                <textarea class="form-control" id="bio" name="bio" rows="3" placeholder="Tell us about yourself"></textarea>
              </div>
              <div class="form-group">
                <label for="cv">CV</label>
                <input type="file" class="form-control-file" id="cv" name="cv" accept="image/*">
              </div>
              <button type="submit" id="" class="btn btn-primary btn-block">Apply</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
      $(document).ready(function() {
          $('#applicationForm').submit(function(event) {
              event.preventDefault(); // Prevent form submission

              // Perform AJAX request to submit the form data
              $.ajax({
                  url: $(this).attr('action'),
                  type: 'POST',
                  data: $(this).serialize(),
                  success: function(response) {
                      if (response.success) {
                          // If application was successfully submitted, hide the "Apply" button
                          $('#applyButton').hide();
                          // Show a message or perform any other actions to indicate success
                          alert('Application sent successfully!');
                      }
                  },
                  error: function(xhr, status, error) {
                      // Handle errors if any
                      console.error(error);
                      alert('An error occurred while processing your application. Please try again later.');
                  }
              });
          });
      });
  </script>
  @endsection
