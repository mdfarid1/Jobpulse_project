@extends('layouts.app')

@section('content')



<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
                <h4 class="mb-4 panel-title">{{ _lang('Blog Add') }}</h4>
				<form  action="" method="POST" enctype="multipart/form-data">
					@csrf
							{{-- <div class="col-md-12">
								<div class="form-group">
									<label class="control-label font-weight-bold">{{ _lang('Blog Category :') }}</label>
									<select class="form-control select2" name="category_id" required>
										<option value="{{$blogs->category_id}}">{{ _lang('Select Category') }}</option>
										{{ create_option('blog_categories','id','category_name') }}
									</select>
								</div>
							</div> --}}

							<div class="col-md-12">
							  <div class="form-group">
								<label class="control-label font-weight-bold">{{ _lang('Title :') }}</label>
								<input type="text" class="form-control" name="title" value="{{$blogs->title}}">
							  </div>
							</div>

							<div class="col-md-12">
							  <div class="form-group">
								<label class="control-label font-weight-bold" for="exampleFormControlTextarea1" >{{ _lang('Description :') }}</label>
								<textarea class="form-control summernote"  id="exampleFormControlTextarea1" name="description">{{$blogs->description}}</textarea>
							  </div>
							</div>

							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label font-weight-bold">{{ _lang('Status :') }}</label>
									<select class="form-control" name="status" value="{$blogs->status}">
										<option value="">{{ _lang('Select Status') }}</option>

                                        <option value="0" {{ $blogs->status == 0 ? 'selected' : '' }}>Hide</option>
                                        <option value="1" {{ $blogs->status == 1 ? 'selected' : '' }}>Hold</option>
                                        <option value="2" {{ $blogs->status == 2 ? 'selected' : '' }}>Published</option>
									</select>
								</div>
							</div>

                            <div class="col-md-12 mt-2">
								<label class="control-label font-weight-bold">{{ _lang('Image :') }}</label>
								{{-- <input type="file" class="form-control dropify" name="blog_img"  data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG"> --}}
                                <input type="file" class="form-control dropify" name="blog_img" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG" data-default-file="{{ $blogs->blog_img != "" ? asset('public/uploads/blog/'.$blogs->blog_img) : '' }}">
                            </div>
							<div class="col-md-12 mt-2">
								<div class="form-group">
								  <label class="control-label font-weight-bold">{{ _lang('Facebook_link :') }}</label>
								  <input type="text" class="form-control" name="facebook_link" value="{{$blogs->social_link_fb}}">
								</div>
							</div>
							  <div class="col-md-12">
								<div class="form-group">
								  <label class="control-label font-weight-bold">{{ _lang('Google_link :') }}</label>
								  <input type="text" class="form-control" name="google_link" value="{{$blogs->social_link_gg}}">
								</div>
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
