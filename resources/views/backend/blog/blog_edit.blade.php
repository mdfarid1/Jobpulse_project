@extends('layouts.app')

@php
$currency = currency();
$base_currency = base_currency();
$date_format = get_company_option('date_format','Y-m-d');
@endphp

@section('content')
<div class="row container py-5 m-auto">


            <div class="col-md-12 mb-5">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mb-4 header-title panel-title">{{ _lang('Circular Create') }}</h4>
                        <form  action="{{ url('post/store') }}" autocomplete="off" class="form-horizontal form-groups-bordered validate" enctype="multipart/form-data" method="post">
                            @csrf


                            {{-- <label for="category">Choose a category:</label>
                            <select name="category" id="category">
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                @endforeach
                            </select> --}}

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <select class="form-control" name="category" id="category" required>
                                                @foreach ($category as $categories)
                                                    <option value="{{ $categories->id }}">{{ $categories->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                        <input type="text" value="{{ Auth::user()->name }}" name="author" class="form-control" placeholder="{{ _lang(Auth::user()->name) }}" required>
                                      </div>
                                    </div>

                                    <div class="col-md-12">
                                      <div class="form-group">
                                        <label class="control-label font-weight-bold">{{ _lang('Title :') }}</label>
                                        <input type="text" class="form-control" name="title" required >
                                      </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                          <label class="control-label font-weight-bold" for="exampleFormControlTextarea1" >{{ _lang('Description :') }}</label>
                                          <textarea class="form-control summernote"  id="exampleFormControlTextarea1" name="description"></textarea>
                                        </div>
                                      </div>

                                      <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label font-weight-bold">{{ _lang('Status :') }}</label>
                                            <select class="form-control" name="status">
                                                <option value="">{{ _lang('Select Status') }}</option>

                                                <option value="0">Hide</option>
                                                <option value="1">Hold</option>
                                                <option value="2">Published</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-12 ">
                                        <div class="form-group mb-2">
                                            <label class="control-label font-weight-bold">{{ _lang('Circular Image') }}</label>
                                            <input type="file" class="form-control dropify"  name="blog_img" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG">
                                        </div>

                                    </div>

                                    <div class="col-md-12 my-2">
                                        <label for="exampleFormControlInput1" class="form-label  font-weight-bold">Facebook Link</label>
                                        <input type="text" class="form-control" id="exampleFormControlInput1" name="fblink" >
                                    </div>

                                    <div class="col-md-12 my-2">
                                        <label for="exampleFormControlInput1" class="form-label font-weight-bold">Google Link</label>
                                        <input type="text" class="form-control" id="exampleFormControlInput1" name="gglink" >
                                    </div>

                                    <div class="col-md-12 mt-3">
                                      <div class="form-group">
                                        <button type="reset" class="btn btn-danger">{{ _lang('Reset') }}</button>
                                        <button type="submit" class="btn btn-primary">{{ _lang('Save') }}</button>
                                      </div>
                                    </div>
                        </form>
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
