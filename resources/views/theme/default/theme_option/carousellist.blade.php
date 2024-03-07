@extends('layouts.app')

@section('content')
<div class="row">
    <div class="col-lg-12">
       <div class="card">
          <div class="card-body">
            <table class="table blogTable table-responsive zero-configuration table-bordered mt-3 table-responsive" id="blogTable">
              <thead>
                <tr>
                  <th scope="col" class="font-weight-bold ">SL</th>
                  {{-- <th scope="col" class="font-weight-bold ">Authore Name</th> --}}
                  <th scope="col" class="font-weight-bold ">NAME</th>
                  <th scope="col" class="font-weight-bold ">DESCRIPTION</th>
                  {{-- <th scope="col" class="font-weight-bold ">STATUS</th> --}}
                  <th scope="col" class="font-weight-bold ">IMAGE</th>
                  <th scope="col" class="text-center font-weight-bold">ACTION</th>

                </tr>
              </thead>
              <tbody>
                @foreach ($carusel as $key=>$cat)
                <tr>

                  <th scope="row">{{++$key}}</th>
                  <td>{{$cat->name}}</td>
                  <td>{!!strlen( $cat->description)>60 ? substr($cat->description,0,100)."[&hellip;]" : $cat->description !!}</td>
                  {{-- <td>{!! $cat->description !!}</td> --}}
                  <td><img src="{{ asset('public/uploads/carusel/'.$cat->img) }}" style="height: 50px;width:70px;" class="img-fluid rounded-start" alt="..."></td>
                  <td class="text-center">
                    <div>
                        <a class="" href="{{url('carusel/edit/'.$cat->id)}}"><i class="ti-pencil-alt text-primary"></i></a>
                    </div>
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
    $('#blogTable').DataTable();
} );

</script>
@endsection
