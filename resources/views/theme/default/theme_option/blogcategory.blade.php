@extends('layouts.app')

@section('content')

<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-body">
                <h4 class="mb-4 panel-title">{{ _lang('Blog Category Add') }}</h4>
				<form  action="{{url('/blogcategorycreate')}}" method="POST">
					@csrf
							<div class="col-md-12">
							  <div class="form-group">
								<label class="control-label font-weight-bold">{{ _lang('Category Title :') }}</label>
								<input type="text" class="form-control" name="category_title" value="">
							  </div>
							</div>

							<div class="col-md-12">
                                <div class="form-group">
                                  <label class="control-label font-weight-bold">{{ _lang('Category Description :') }}</label>
                                  <input type="text" class="form-control" name="category_description" value="">
                                </div>
                            </div>

							<div class="col-md-12">
								<div class="row">
									<div class="col-md-6">
											<label class="control-label font-weight-bold">{{ _lang('Image :') }}</label>
											<input class="form-control form-control-lg"  type="file" name="img">
									</div>

									{{-- <div class="col-md-6">
										<div class="form-group">
											<label class="control-label font-weight-bold">{{ _lang('Company Id :') }}</label>
											<select class="form-control select2" name="company_id" required>
												<option value="">{{ _lang('Select Package') }}</option>
												{{ create_option('packages','id','package_name',old('package_id')) }}
											</select>
										  </div>
									</div> --}}
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
