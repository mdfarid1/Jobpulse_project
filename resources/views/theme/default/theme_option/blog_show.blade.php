@extends('layouts.app')

@section('content')
<h4 class="mb-4 header-title panel-title">{{ _lang('Circular List') }}</h4>
<div class="row">
    <div class="col-lg-12">
       <div class="card">
          <div class="card-body">
            <table class="table blogTable table-responsive zero-configuration table-bordered mt-3 table-responsive" id="blogTable">
              <thead>
                <tr>
                  <th scope="col" class="text-center font-weight-bold">ACTION</th>
                  <th scope="col" class="font-weight-bold ">ID</th>
                  <th scope="col" class="font-weight-bold ">Authore Name</th>
                  <th scope="col" class="font-weight-bold ">TITLE</th>
                  <th scope="col" class="font-weight-bold ">DESCRIPTION</th>
                  <th scope="col" class="font-weight-bold ">STATUS</th>
                  <th scope="col" class="font-weight-bold ">IMAGE</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($posts as $key=>$cat)
                <tr>
                    <td class="text-center">
                    <div>
                        <a class="" href="{{url('blog/edit',$cat->id)}}"><i class="ti-pencil-alt text-primary"></i></a>
                    </div>

                    <div>
                        <form action="{{ route('delete.post', ['id' => $cat->id]) }}" method="post">
                            @csrf
                            @method('post')
                            <button class="btn" onclick="return confirm('Are you sure you want to delete this post?')"> <i class="ti-trash text-danger"></i></button>
                        </form>
                    </div>

                      </td>
                  <th scope="row">{{++$key}}</th>
                  <td>{{$cat->user->name}}</td>
                  <td>{{$cat->title}}</td>
                  <td>{!!strlen( $cat->description)>40 ? substr($cat->description,0,120)."[&hellip;]" : $cat->description !!}</td>
                  @if ($cat->status == 0)
                  <td class="text-center"><span class="badge bg-danger text-dark">Hidden</span></td>
                    @elseif ($cat->status == 1)
                        <td class="text-center"><span class="badge bg-warning text-dark">On Hold</span></td>
                    @elseif ($cat->status == 2)
                        <td class="text-center"><span class="badge bg-success text-dark">Published</span></td>
                    @else
                        <td class="text-center"><span class="badge bg-danger text-dark">Unknown Status</span></td>
                    @endif
                  <td><img src="{{asset('public/uploads/blog/'.$cat->blog_img)}}" style="height: 50px;width:70px;" class="img-fluid rounded-start" alt="..."></td>

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
