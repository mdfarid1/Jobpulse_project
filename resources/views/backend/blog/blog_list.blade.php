@extends('layouts.app')

@php
$currency = currency();
$base_currency = base_currency();
$date_format = get_company_option('date_format','Y-m-d');
@endphp

@section('content')
<div class="row py-5 m-auto">

    <div class="col-md-12">
        <div class="tab-content">

            <div class="col-md-12 mb-5">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mb-4 header-title panel-title">{{ _lang('Circular List') }}</h4>
                            <div class="row">
                                <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="table blogTable zero-configuration table-bordered mt-3 table-responsive" id="blogTable">
                                        <thead>
                                            <tr>
                                            <th scope="col" class="font-weight-bold ">Action</th>
                                            <th scope="col" class="font-weight-bold ">SL</th>
                                            <th scope="col" class="font-weight-bold ">TITLE</th>
                                            <th scope="col" class="font-weight-bold ">DESCRIPTION</th>
                                            <th scope="col" class="font-weight-bold ">STATUS</th>
                                            <th scope="col" class="font-weight-bold ">IMAGE</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            @foreach( $postlist->blogs as $key=>$cat )
                                            <tr>
                                                <td class="text-center">
                                                    <div>
                                                        <a class="" href="{{url('circular/edit',$cat->id)}}"><i class="ti-pencil-alt text-primary"></i></a>
                                                    </div>

                                                    <div>
                                                        <form action="{{ route('delete.circular', ['id' => $cat->id]) }}" method="post">
                                                            @csrf
                                                            @method('post')
                                                            <button class="btn" onclick="return confirm('Are you sure you want to delete this post?')"> <i class="ti-trash text-danger"></i></button>
                                                        </form>
                                                    </div>

                                                </td>
                                            <th scope="row">{{++$key}}</th>
                                            <td>{!!strlen( $cat->title)>40 ? substr($cat->title,0,32)."[&hellip;]" : $cat->title !!}</td>
                                            <td>{!!strlen( $cat->description)>110 ? substr($cat->description,0,112)."[&hellip;]" : $cat->description !!}</td>
                                            @if ($cat->status == 0)
                                            <td class="text-center"><span class="badge bg-danger text-dark">Hidden</span></td>
                                              @elseif ($cat->status == 1)
                                                  <td class="text-center"><span class="badge bg-warning text-dark">On Hold</span></td>
                                              @elseif ($cat->status == 2)
                                                  <td class="text-center"><span class="badge bg-success text-dark">Published</span></td>
                                              @else
                                                  <td class="text-center"><span class="badge bg-danger text-dark">Unknown Status</span></td>
                                              @endif
                                            <td><img style="height:50px; width:65px;" src="{{asset('public/uploads/blog/'.$cat->blog_img)}}" class="img-fluid rounded-start" alt="..."></td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                        </table>
                                    </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
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
