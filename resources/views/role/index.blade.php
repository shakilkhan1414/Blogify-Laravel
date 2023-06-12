<x-admin-master>

    @section('main-content')

    <div class="row">
        <div class="col-sm-3">
            <h4>Create Role</h4>
            <hr>

            @if (count($errors)>0)
                @foreach ($errors->all() as $error)
                    <div class="alert alert-danger">{{$error}}</div>
                @endforeach
            @endif

            <form action="{{route('role.store')}}" method="post">

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
            @if (session()->has('role-delete'))
                <div class="alert alert-danger">{{session('role-delete')}}</div>
            @endif
            @if (session()->has('add-role-message'))
                <div class="alert alert-success">{{session('add-role-message')}}</div>
            @endif
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Roles</h6>
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
                          @foreach ($roles as $role)
                            <tr>
                                <td>{{$role->id}}</td>
                                <td>{{$role->name}}</td>
                                <td>{{$role->slug}}</td>
                                <td>
                                    <a href="{{route('role.edit',$role)}}" class="btn btn-primary btn-sm" style="margin-bottom: 5px">Edit</a>
                                    <form action="{{route('role.destroy',$role)}}" method="post">
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
