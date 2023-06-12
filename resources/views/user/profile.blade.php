<x-admin-master>

    @section('main-content')

        <h2 class="text-center">Profile</h2>
        <div class="row">
            <div class="col-sm-6">
                @if (Session::has('update-user'))
                    <div class="alert alert-success">{{session('update-user')}}</div>
                @endif
                <form action="{{route('user.profile.update',$user)}}" method="post" enctype="multipart/form-data">

                    {{ csrf_field() }}
                    @method('put')

                    <div class="form-group">
                        <img height="150px" width="150px" style="border-radius: 50%; margin-right:10px" src="{{$user->avatar}}" alt="user-image"> <label style="cursor: pointer;" for="avatar">change</label>

                    </div>

                    <div class="form-group">
                        <input type="file" class="form-control d-none @error('avatar') is-invalid @enderror" name="avatar" id="avatar">

                        @error('avatar')
                            <div class="text-danger">{{$message}}</div>
                        @enderror

                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control {{$errors->has('username') ? 'is-invalid' : '' }}" name="username" id="username" value="{{$user->username}}">

                        @error('username')
                            <div class="text-danger">{{$message}}</div>
                        @enderror

                    </div>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control {{$errors->has('name') ? 'is-invalid' : '' }}" name="name" id="name" value="{{$user->name}}">

                        @error('name')
                            <div class="text-danger">{{$message}}</div>
                        @enderror

                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" class="form-control {{$errors->has('email') ? 'is-invalid' : '' }}" id="email" value="{{$user->email}}">

                        @error('email')
                            <div class="text-danger">{{$message}}</div>
                        @enderror

                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control {{$errors->has('password') ? 'is-invalid' : '' }}" id="password">

                        @error('password')
                            <div class="text-danger">{{$message}}</div>
                        @enderror

                    </div>
                    <div class="form-group">
                        <label for="confirm-password">Confirm Password</label>
                        <input type="password" name="confirm-password" class="form-control" id="confirm-password">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>

    @endsection

</x-admin-master>
