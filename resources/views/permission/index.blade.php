<x-admin-master>

    @section('main-content')

    <div class="row">
        <div class="col-sm-3">
            <h4>Create Permission</h4>
            <hr>

            @if (count($errors)>0)
                @foreach ($errors->all() as $error)
                    <div class="alert alert-danger">{{$error}}</div>
                @endforeach
            @endif

            <form action="{{route('permission.store')}}" method="post">

                {{ csrf_field() }}
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" class="form-control
                    @error('name')
                        is-invalid
                    @enderror
                    ">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Create">
                </div>

            </form>
        </div>
        <div class="col-sm-9">
            @if (session()->has('permission-delete'))
                <div class="alert alert-danger">{{session('permission-delete')}}</div>
            @endif
            @if (session()->has('add-permission-message'))
                <div class="alert alert-success">{{session('add-permission-message')}}</div>
            @endif
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Permissions</h6>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                      <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Slug</th>
                            <th>Action</th>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Slug</th>
                            <th>Action</th>
                        </tr>
                      </tfoot>
                      <tbody>
                          @foreach ($permissions as $permission)
                            <tr>
                                <td>{{$permission->id}}</td>
                                <td>{{$permission->name}}</td>
                                <td>{{$permission->slug}}</td>
                                <td>
                                    <form action="{{route('permission.destroy',$permission)}}" method="post">
                                        {{ csrf_field() }}
                                        @method('Delete')
                                        <input type="submit" value="Delete" class="btn btn-danger btn-sm">
                                    </form>
                                </td>
                            </tr>
                          @endforeach

                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
        </div>
    </div>


    @endsection

    @section('scripts')
        <script src="{{asset('vendor/datatables/jquery.dataTables.min.js')}}"></script>
        <script src="{{asset('vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>
        {{-- <script src="{{asset('js/demo/datatables-demo.js')}}"></script> --}}
    @endsection

</x-admin-master>
