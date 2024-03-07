@extends('layouts.app')

@section('content')

<div class="row">

    <div class="col-lg-12">
    <a href="{{ url('governing/create') }}"><button class="btn btn-primary px-3">Governor Add</button></a>

       <div class="card">
          <div class="card-body">
            <table class="table blogTable table-responsive zero-configuration table-bordered mt-3 table-responsive" id="blogTable">
              <thead>
                <tr>
                  <th scope="col" class="text-center font-weight-bold">ACTION</th>
                  <th scope="col" class="font-weight-bold ">SL</th>
                  <th scope="col" class="font-weight-bold ">Name</th>
                  <th scope="col" class="font-weight-bold ">TITLE</th>
                  <th scope="col" class="font-weight-bold ">IMAGE</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($Govornor as $key=>$cat)
                <tr>
                    <td class="text-center">
                    <div>
                        <a class="" href="{{url('director/edit/'.$cat->id)}}"><i class="ti-pencil-alt text-primary"></i></a>
                    </div>

                    <div>
                        <form action="{{ route('governing.destroy', ['id' => $cat->id]) }}" method="post">
                            @csrf
                            @method('post')
                            <button class="btn" onclick="return confirm('Are you sure you want to delete this governor?')"> <i class="ti-trash text-danger"></i></button>
                        </form>
                    </div>

                      </td>
                  <th scope="row">{{++$key}}</th>
                  <td>{{$cat->name}}</td>
                  <td>{{$cat->title}}</td>
                  {{-- <td>{!!strlen( $cat->description)>40 ? substr($cat->description,0,120)."[&hellip;]" : $cat->description !!}</td> --}}
                  {{-- <td>{!! $cat->description !!}</td> --}}
                  <td><img src="{{ asset('public/uploads/govornor/'.$cat->img) }}" style="height: 70px;width:70px;" class="img-fluid rounded-start" alt="..."></td>
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
