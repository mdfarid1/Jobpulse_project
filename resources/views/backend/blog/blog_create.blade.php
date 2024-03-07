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
                        <h4 class="mb-4 header-title panel-title">{{ _lang('Circular Update') }}</h4>
                        <form  action="{{ url('circular/update/'.$blog->id) }}" autocomplete="off" class="form-horizontal form-groups-bordered validate" enctype="multipart/form-data" method="post">
                            @csrf


                            {{-- <label for="category">Choose a category:</label>
                            <select name="category" id="category">
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                @endforeach
                            </select> --}}

                                    {{-- <div class="col-md-12">
                                        <div class="form-group">
                                            <select class="form-control" name="category"  id="category" required>
                                                @foreach ($category as $categories)
                                                    <option value="{{ $categories->id }}">{{ $categories->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div> --}}


                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label font-weight-bold">{{ _lang('Status :') }}</label>
                                            <select class="form-control" name="category" value="{ $blog->category }">
                                                <option value="">{{ _lang('Select Status') }}</option>

                                                <option value="0" {{ $blog->category == 0 ? 'selected' : '' }}>Web Developer</option>
                                                <option value="1" {{ $blog->category == 1 ? 'selected' : '' }}>Graphic Designer</option>
                                                <option value="2" {{ $blog->category == 2 ? 'selected' : '' }}>Video Editor</option>
                                                <option value="3" {{ $blog->category == 3 ? 'selected' : '' }}>Digital Marketor</option>
                                                <option value="4" {{ $blog->category == 4 ? 'selected' : '' }}>Others</option>

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
                                        <input type="text" class="form-control" value="{{$blog->title}}" name="title" required >
                                      </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                          <label class="control-label font-weight-bold" for="exampleFormControlTextarea1" >{{ _lang('Description :') }}</label>
                                          <textarea class="form-control summernote"  id="exampleFormControlTextarea1" name="description">{{$blog->description}}</textarea>
                                        </div>
                                      </div>


                                      <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label font-weight-bold">{{ _lang('Status :') }}</label>
                                            <select class="form-control" name="status" value="{$blog->status}">
                                                <option value="">{{ _lang('Select Status') }}</option>

                                                <option value="0" {{ $blog->status == 0 ? 'selected' : '' }}>Hide</option>
                                                <option value="1" {{ $blog->status == 1 ? 'selected' : '' }}>Hold</option>
                                                <option value="2" {{ $blog->status == 2 ? 'selected' : '' }}>Published</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="col-md-12 ">
                                        <div class="form-group mb-2">
                                            <label class="control-label font-weight-bold">{{ _lang('Circular Image') }}</label>
                                            <input type="file" class="form-control dropify" name="blog_img" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG" data-default-file="{{ $blog->blog_img != "" ? asset('public/uploads/blog/'.$blog->blog_img) : '' }}">
                                        </div>

                                    </div>

                                    <div class="col-md-12 my-2">
                                        <label for="exampleFormControlInput1" class="form-label  font-weight-bold">Facebook Link</label>
                                        <input type="text" class="form-control" id="exampleFormControlInput1" value="{{$blog->fblink}}"  name="fblink" >
                                    </div>

                                    <div class="col-md-12 my-2">
                                        <label for="exampleFormControlInput1" class="form-label font-weight-bold">Google Link</label>
                                        <input type="text" class="form-control" id="exampleFormControlInput1" value="{{$blog->gglink}}" name="gglink" >
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
