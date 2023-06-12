<x-admin-master>

    @section('main-content')

        @if (Session::has('message'))
            <div class="alert alert-danger">{{session('message')}}</div>
        @endif

        @if (Session::has('created-message'))
            <div class="alert alert-success">{{session('created-message')}}</div>
        @endif

        @if (Session::has('updated-message'))
            <div class="alert alert-success">{{session('updated-message')}}</div>
        @endif

        <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">All Posts</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                        <th>ID</th>
                        <th>Owner</th>
                        <th>Title</th>
                        <th>Image</th>
                        <th>Created At</th>
                        <th>Updated At</th>
                        <th>Action</th>
                    </tr>
                  </thead>
                  <tfoot>
                        <tr>
                        <th>ID</th>
                        <th>Owner</th>
                        <th>Title</th>
                        <th>Image</th>
                        <th>Created At</th>
                        <th>Updated At</th>
                        <th>Action</th>
                    </tr>
                  </tfoot>
                  <tbody>
                      @foreach ($posts as $post)
                        <tr>
                            <td>{{$post->id}}</td>
                            <td>{{$post->user->name}}</td>
                            <td>{{$post->title}}</td>
                            <td><img height="40px" src="{{$post->post_image}}" alt="post-image"></td>
                            <td>{{$post->created_at->diffForHumans()}}</td>
                            <td>{{$post->updated_at->diffForHumans()}}</td>
                            <td>

                                <a href="{{route('post.edit',$post->id)}}" class="btn btn-primary btn-sm" style="margin-bottom: 5px;">Edit</a>

                                @can('view', $post)
                                    <form action="{{route('post.destroy',$post->id)}}" method="post" enctype="multipart/form-data">
                                        {{ csrf_field() }}
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                    </form>
                                @endcan

                            </td>
                        </tr>
                      @endforeach

                  </tbody>
                </table>
              </div>
              {{$posts->links()}}
            </div>
          </div>


    @endsection

    @section('scripts')
        <script src="{{asset('vendor/datatables/jquery.dataTables.min.js')}}"></script>
        <script src="{{asset('vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>
        {{-- <script src="{{asset('js/demo/datatables-demo.js')}}"></script> --}}
    @endsection




</x-admin-master>
