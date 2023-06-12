<x-admin-master>

    @section('main-content')

    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
      tinymce.init({
        selector: '#body'
      });
    </script>

        <h2 class="text-center">Edit Post</h2>

        @if (count($errors)>0)
            @foreach ($errors->all() as $error)
                <div class="alert alert-danger">{{$error}}</div>
            @endforeach
        @endif

        <form action="{{route('post.update',$post->id)}}" method="post" enctype="multipart/form-data">
            {{ csrf_field() }}
            @method('PATCH')
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" name="title" id="title" placeholder="Enter Title" value="{{$post->title}}">
            </div>
            <div class="form-group">
                <label for="body">Body</label>
                <textarea name="body" id="body" cols="30" class="form-control" rows="5" placeholder="Enter Body">{{$post->body}}</textarea>
            </div>
            <div class="form-group">
                <label for="category">Category</label>
                <select name="category" id="category" class="form-control">
                    @foreach (App\Models\Category::all() as $category)
                        <option value="{{$category->id}}"
                            @if ($post->categories->contains($category))
                                selected
                            @endif
                                >{{$category->name}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label for="image">Image</label>
                <div><img height="100px" src="{{$post->post_image}}" alt="post-image"></div><br>
                <input type="file" name="image" id="image" class="form-control">
            </div>
            <br>
            <div class="form-group">
                <button type="submit" class="form-control btn btn-primary">Update Post</button>
            </div>

        </form>

    @endsection

</x-admin-master>
