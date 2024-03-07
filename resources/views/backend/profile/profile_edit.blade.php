@extends('layouts.app')

@php
$currency = currency();
$base_currency = base_currency();
$date_format = get_company_option('date_format','Y-m-d');
@endphp

@section('content')
<div class="row m-auto">
    <div class="col-sm-12">
        <div class="">
            <div class="">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mb-4 header-title panel-title">{{ _lang('Profile Settings') }}</h4>
                        <form action="{{ url('profile/update')}}" autocomplete="off" class="form-horizontal form-groups-bordered validate" enctype="multipart/form-data" method="post">
                            @csrf
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label class="control-label font-weight-bold">{{ _lang('Name') }}</label>
                                        <input type="text" class="form-control" name="name" value="{{$profile->name}}" >
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label class="control-label font-weight-bold">{{ _lang('Email') }}</label>
                                        <input type="text" class="form-control" name="email" value="{{ $profile->email }}">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label font-weight-bold">{{ _lang('Profession') }}</label>
                                        <input type="text" class="form-control" name="business_name" value="{{ $profile->company->business_name }}" placeholder="{{ _lang('Your Profession') }}" >
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label class="control-label font-weight-bold">{{ _lang('Bio') }}</label>
                                        <input type="text" class="form-control" name="bio" value="{{ $profile->bio }}" placeholder="{{ _lang('Your Bio') }}">
                                    </div>
                                </div>
                            </div>



                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label class="control-label font-weight-bold">{{ _lang('Image') }} (300 X 300)</label>
                                        <input type="file" class="form-control dropify" data-default-file="{{ $profile->profile_picture != "" ? asset('public/uploads/profile/'.$profile->profile_picture) : '' }}" name="profile_picture" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label class="control-label font-weight-bold">{{ _lang('Address') }}</label>
                                        <input type="text" class="form-control" name="address" value="{{ $profile->address }}" placeholder="{{ _lang('Your Address') }}">
                                    </div>
                                </div>
                            </div>



                            {{-- <div class="form-group mb-2">
                                <label class="control-label">{{ _lang('Language') }}</label>
                                <select class="form-control select2" name="language">
                                    <option value="">{{ _lang('-- Select One --') }}</option>
                                    {{ load_language( $profile->language ) }}
                                </select>
                            </div> --}}


                            <hr>
                          <h4 class="mb-4 header-title panel-title font-weight-bold">{{ _lang('Social Share') }}</h4>


                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label class="control-label font-weight-bold">{{ _lang('Facebook') }}</label>
                                        <input type="text" class="form-control" name="facebook" value="{{$profile->facebook}}" >
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label class="control-label font-weight-bold">{{ _lang('Linkedin') }}</label>
                                        <input type="text" class="form-control" name="linkedin" value="{{ $profile->linkedin }}" >
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label class="control-label font-weight-bold">{{ _lang('Instragram') }}</label>
                                        <input type="text" class="form-control" name="instragram" value="{{$profile->instragram}}" >
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label class="control-label font-weight-bold">{{ _lang('Tiktok') }}</label>
                                        <input type="text" class="form-control" name="tiktok" value="{{ $profile->tiktok }}" >
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">{{ _lang('Update Profile') }}</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>


    </div>
</div>
@endsection
@section('js-script')
<script>
$(document).ready( function () {
    $('#blogTable').DataTable();
} );

</script>
@endsection
