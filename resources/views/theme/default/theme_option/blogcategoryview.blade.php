@extends('layouts.app')

@section('content')
<h4 class="mb-4 header-title panel-title">{{ _lang('Blog Category View') }}</h4>
<div class="mb-3">
  <a href="{{ url('/blogcategory')}}"><button type="button" class="btn px-3 mt-2 btn-outline-warning"> <span class="font-weight-bold text-dark"><i class="ti-plus"></i>CATEGORY ADD </span></button></a>
</div>
<div class="row">
  <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
              <table class="table zero-configuration table-bordered m-auto mt-3 table-responsive" id="blog_category">
                <thead>
                  <tr>
                    <th scope="col" class="font-weight-bold ">ID</th>
                    <th scope="col" class="font-weight-bold ">CATEGORY_TITLE</th>
                    <th scope="col" class="font-weight-bold ">CATEGORY_DESCRIPTION</th>
                    <th scope="col" class="font-weight-bold ">IMAGE</th>
                    <th scope="col" class="font-weight-bold ">COMPANY_ID</th>
                    <th scope="col" class="text-center font-weight-bold" >ACTION</th>
                  </tr>
                </thead>
                <tbody>
                    @foreach ($category as $key=>$value)
                    <tr>
                    <th scope="row">{{++$key}}</th>
                    <td>{{$value->category_name}}</td>
                    <td>{{$value->category_description}}</td>
                    <td>{{$value->img}}</td>
                    <td>{{$value->company_id}}</td>
                    <td class="text-center">
                      <a class="" href=""><i class="ti-pencil-alt text-primary"></i></a>
                      <a class="" href=""><i class="ti-eye text-success"></i></a>
                      <a class="" href=""><i class="ti-trash text-danger"></i></a>
                    </td>
                  </tr>
                    @endforeach
                </tbody>
              </table>
            </div>  
        </div>
    </div> 
</div>                     
@endsection

@section('js-script')
<script>
$(document).ready( function () {
    $('#blog_category').DataTable();
} );

</script>
@endsection