@extends('layouts.app')

@section('content')

<div class="row">
    <div class="col-lg-12">
       <div class="card">
          <div class="card-body">
            <table class="table blogTable table-responsive zero-configuration table-bordered mt-3 table-responsive" id="blogTable">
              <thead>
                <tr>
                  <th scope="col" class="text-center font-weight-bold">ACTION</th>
                  <th scope="col" class="font-weight-bold ">SL</th>
                  {{-- <th scope="col" class="font-weight-bold ">Authore Name</th> --}}
                  <th scope="col" class="font-weight-bold ">TITLE</th>
                  <th scope="col" class="font-weight-bold ">DESCRIPTION</th>
                  {{-- <th scope="col" class="font-weight-bold ">STATUS</th> --}}
                  <th scope="col" class="font-weight-bold ">IMAGE</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($items as $key=>$cat)
                <tr>
                    <td class="text-center">
                    <div>
                        <a class="" href="{{url('services/edit/'.$cat->id)}}"><i class="ti-pencil-alt text-primary"></i></a>
                    </div>

                    {{-- <div>
                        <form action="{{ route('services.destroy', ['id' => $cat->id]) }}" method="post">
                            @csrf
                            @method('post')
                            <button class="btn" onclick="return confirm('Are you sure you want to delete this post?')"> <i class="ti-trash text-danger"></i></button>
                        </form>
                    </div> --}}

                      </td>
                  <th scope="row">{{++$key}}</th>
                  <td>{{$cat->name}}</td>
                  <td>{!!strlen( $cat->description)>40 ? substr($cat->description,0,120)."[&hellip;]" : $cat->description !!}</td>
                  {{-- <td>{!! $cat->description !!}</td> --}}
                  <td><img src="{{ asset('public/uploads/service/'.$cat->img) }}" style="height: 50px;width:70px;" class="img-fluid rounded-start" alt="..."></td>
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
