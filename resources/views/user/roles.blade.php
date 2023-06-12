<x-admin-master>

    @section('main-content')

    @if (Session::has('attach-message'))
            <div class="alert alert-success">{{session('attach-message')}}</div>
    @endif

    @if (Session::has('detach-message'))
            <div class="alert alert-danger">{{session('detach-message')}}</div>
    @endif

    <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Roles for {{$user->username}}</h6>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="RolesTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                    <th>Options</th>
                    <th>Name</th>
                    <th>Slug</th>
                    <th>Attach</th>
                    <th>Detach</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                    <th>Options</th>
                    <th>Name</th>
                    <th>Slug</th>
                    <th>Attach</th>
                    <th>Detach</th>
                </tr>
              </tfoot>
              <tbody>
                  @foreach ($roles as $role)
                    <tr>
                        <td><input type="checkbox" name="check" id="check"
                            @if ($user->roles->contains($role))
                                checked
                            @endif
                        ></td>
                        <td>{{$role->name}}</td>
                        <td>{{$role->slug}}</td>
                        <td>
                            <form action="{{route('user.role.attach',$user)}}" method="post" enctype="multipart/form-data">
                                {{ csrf_field() }}
                                @method('PUT')
                                <input type="hidden" name="role" value="{{$role->id}}">
                                <button type="submit" class="btn btn-primary btn-sm"
                                    @if ($user->roles->contains($role))
                                        disabled
                                    @endif
                                >Attach</button>
                            </form>
                        </td>
                        <td>
                            <form action="{{route('user.role.detach',$user)}}" method="post" enctype="multipart/form-data">
                                {{ csrf_field() }}
                                @method('PUT')
                                <input type="hidden" name="role" value="{{$role->id}}">
                                <button type="submit" class="btn btn-danger btn-sm"
                                    @if (!$user->roles->contains($role))
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


    @endsection

    @section('scripts')
        <script src="{{asset('vendor/datatables/jquery.dataTables.min.js')}}"></script>
        <script src="{{asset('vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>
        {{-- <script src="{{asset('js/demo/datatables-demo.js')}}"></script> --}}
    @endsection




</x-admin-master>
