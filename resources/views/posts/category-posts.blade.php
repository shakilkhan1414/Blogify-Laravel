<x-home-master>

    @section('main-content')

        <h2 class="my-4">Category: {{$category_name}}</h2>

        <!-- Blog Post -->
        <div class="d-flex flex-wrap justify-content-left">

            @foreach ($posts as $post)
            <div class="card mb-4 mx-4 col-sm-5" style="padding: 0px;">
                <img class="card-img-top" style="height:180px;" src="{{$post->post_image}}" alt="Card image cap">
                <div class="card-body">
                    <h3 class="card-title" style="font-size: 22px;">{{Illuminate\Support\Str::limit($post->title,'40','...')}}</h3>
                    <p class="card-text">{{Illuminate\Support\Str::limit($post->body,'150','...')}}</p>
                    <a href="{{route('post',$post->id)}}" class="btn btn-primary">Read More &rarr;</a>
                </div>
                <div class="card-footer text-muted">
                    Posted {{$post->created_at->diffForHumans()}} by
                    <a href="#">{{$post->user->name}}</a>
                </div>
            </div>

            @endforeach

        </div>

        <!-- Pagination -->
        {{-- {{$posts->links()}} --}}

    @endsection

</x-home-master>
