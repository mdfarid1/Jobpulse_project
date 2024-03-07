@extends('layouts.app')

@section('content')



<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
                <h4 class="mb-4 panel-title">{{ _lang('Blog Add') }}</h4>
				<form  action="{{ url('blog/store') }}" method="POST" enctype="multipart/form-data">
					@csrf
                        <div class="col-md-12">
                            <div class="form-group">
                            <label class="control-label font-weight-bold">{{ _lang('Title :') }}</label>
                            <input type="text" class="form-control" name="title" value="">
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                              <label class="control-label font-weight-bold" for="exampleFormControlTextarea1" >{{ _lang('Description :') }}</label>
                              <textarea class="form-control summernote"  id="exampleFormControlTextarea1" name="description"></textarea>
                            </div>
                          </div>

                            <div class="col-md-12 mt-2">
								<label class="control-label font-weight-bold">{{ _lang('Image :') }}</label>
                                <input type="file" class="form-control dropify" name="img" data-allowed-file-extensions="png jpg jpeg PNG JPG JPEG" data-default-file="">
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
