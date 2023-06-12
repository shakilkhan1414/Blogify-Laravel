<x-admin-master>

    @section('main-content')

    <div class="row">
            @if (session()->has('role-update'))
                <div class="col-sm-12">
                    <div class="alert alert-success">{{session('role-update')}}</div>
                </div>
            @endif

        <div class="col-sm-4">
            <h3>Edit role: {{$role->name}}</h3>
            <form action="{{route('role.update',$role)}}" method="post">

                {{ csrf_field() }}
                @method('PUT')
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" value="{{$role->name}}" id="name" class="form-control
                    @error('name')
                        is-invalid
                    @enderror
                    ">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Update">
                </div>

            </form>
        </div>

    </div>

    <div class="row">
        <div class="col-sm-12">
            @if (session()->has('detach-message'))
                <div class="alert alert-danger">{{session('detach-message')}}</div>
            @endif
            @if (session()->has('attach-message'))
                <div class="alert alert-success">{{session('attach-message')}}</div>
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
                            <th>Options</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Slug</th>
                            <th>Attach</th>
                            <th>Detach</th>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr>
                            <th>Options</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Slug</th>
                            <th>Attach</th>
                            <th>Detach</th>
                        </tr>
                      </tfoot>
                      <tbody>
                          @foreach ($permissions as $permission)
                            <tr>
                                <td><input type="checkbox" name="check" id="check"
                                    @foreach ($role->Permissions as $role_permission)
                                        @if ($role_permission->slug == $permission->slug)
                                            checked
                                        @endif
                                    @endforeach
                                    ></td>
                                <td>{{$permission->id}}</td>
                                <td>{{$permission->name}}</td>
                                <td>{{$permission->slug}}</td>
                                <td>
                                    <form action="{{route('permission.attach',$role)}}" method="post" enctype="multipart/form-data">
                                        {{ csrf_field() }}
                                        @method('PUT')
                                        <input type="hidden" name="permission" value="{{$permission->id}}">
                                        <button type="submit" class="btn btn-primary btn-sm"
                                            @if ($role->permissions->contains($permission))
                                                disabled
                                            @endif
                                        >Attach</button>
                                    </form>
                                </td>
                                <td>
                                    <form action="{{route('permission.detach',$role)}}" method="post" enctype="multipart/form-data">
                                        {{ csrf_field() }}
                                        @method('PUT')
                                        <input type="hidden" name="permission" value="{{$permission->id}}">
                                        <button type="submit" class="btn btn-danger btn-sm"
                                            @if (!$role->permissions->contains($permission))
                                                disabled
                                            @endif
                                        >Detach</button>
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
