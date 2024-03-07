@extends('layouts.app')

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
                <h4 class="mb-4 panel-title">{{ _lang('Blog Add') }}</h4>
				<form  action="" method="POST">
					@csrf
							<div class="col-md-12">
							  <div class="form-group">
								<label class="control-label font-weight-bold">{{ _lang('Title :') }}</label>						
								<input type="text" class="form-control" name="title" value="{{$blogs->title}}">
							  </div>
							</div>

							<div class="col-md-12">
							  <div class="form-group">
								<label class="control-label" for="exampleFormControlTextarea1" >{{ _lang('Description') }}</label>						
								<textarea class="form-control summernote" id="exampleFormControlTextarea1" name="description
								"></textarea>
							  </div>
							</div>

                            <div class="col-md-12 ">
                                <input class="form-control form-control-lg" id="formFileLg" type="file" name="file">
                            </div>

                            <div class="col-md-12 my-2">
                                <label for="exampleFormControlInput1" class="form-label fw-bold">Facebook Link</label>
                                <input type="text" class="form-control" id="exampleFormControlInput1" name="fblink" 
                            </div>

                            <div class="col-md-12 my-2">
                                <label for="exampleFormControlInput1" class="form-label fw-bold">Google Link</label>
                                <input type="text" class="form-control" id="exampleFormControlInput1" name="gglink" 
                            </div>

							<div class="col-md-12 mt-3">
							  <div class="form-group">
								<button type="reset" class="btn btn-danger">{{ _lang('Reset') }}</button>
								<button type="submit" class="btn btn-primary">{{ _lang('Save') }}</button>
							  </div>
							</div>
						</div>
					</div>					
				</form>
	    </div>
</div>
@endsection