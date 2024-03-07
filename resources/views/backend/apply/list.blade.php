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
                  <th scope="col" class="text-center font-weight-bold">For Approval</th>
                  <th scope="col" class="font-weight-bold ">SL</th>
                  <th scope="col" class="font-weight-bold ">Name</th>
                  <th scope="col" class="font-weight-bold ">JOB TITLE</th>
                  <th scope="col" class="font-weight-bold ">Published Date</th>
                  <th scope="col" class="font-weight-bold ">STATUS</th>
                  <th scope="col" class="font-weight-bold ">Document</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($applies as $key=>$cat)
                @if (Auth::user()->id == $cat->user_id)

                <tr>
                    <td class="text-center">
                        <form action="{{ route('apply.update', $cat->id) }}" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="form-group">
                                <input type="checkbox" name="status" value="approved" {{ $cat->status === 'approved' ? 'checked' : '' }}>
                            </div>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </td>
                    <th scope="row">{{ ++$key }}</th>
                    <td>{{ $cat->user->name }}</td>
                    <td>{{ $cat->blog->title }}</td>
                    <td>{{ $cat->created_at }}</td>
                    @if ($cat->status == 'On Hold')
                    <td><span class="badge bg-warning text-dark">Pending</span></td>
                    @else
                    <td><span class="badge bg-success text-dark">{{ $cat->status }}</span></td>
                    @endif
                    <td id="pdf-container">
                        <embed src="{{ asset('public/uploads/apply/'.$cat->cv) }}" type="application/pdf" width="600px" height="100px" />
                    </td>
                </tr>
                @endif

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.min.js"></script>

<div id="pdf-container"></div>

<script>
    // Fetch the PDF document
    const url = "{{ asset('path/to/your/pdf/file.pdf') }}";

    // Asynchronously download PDF
    const loadingTask = pdfjsLib.getDocument(url);
    loadingTask.promise.then(function(pdf) {
        // Fetch the first page
        pdf.getPage(1).then(function(page) {
            const scale = 1.5;
            const viewport = page.getViewport({ scale: scale });

            // Prepare canvas using PDF page dimensions
            const canvas = document.createElement('canvas');
            const context = canvas.getContext('2d');
            canvas.height = viewport.height;
            canvas.width = viewport.width;

            // Render PDF page into canvas context
            const renderContext = {
                canvasContext: context,
                viewport: viewport
            };
            const renderTask = page.render(renderContext);
            renderTask.promise.then(function() {
                document.getElementById('pdf-container').appendChild(canvas);
            });
        });
    });
</script>

@endsection
