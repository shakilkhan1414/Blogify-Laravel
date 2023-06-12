<x-home-master>

    @section('main-content')
                <!-- Title -->
        <h1 class="mt-4">{{$post->title}}</h1>

        <!-- Author -->
        <p>
            by
            <a href="">{{$post->user->name}}</a>
        </p>

        <hr>

        <!-- Date/Time -->
        <p>Posted {{$post->created_at->diffForHumans()}}</p>

        <hr>

        <!-- Preview Image -->
        <img class="img-fluid rounded" src="{{$post->post_image}}" alt="blog-image">

        <hr>

        <!-- Post Content -->
        <p>{!! $post->body !!}</p>

        <hr>



        <x-comments-blogpage></x-comments-blogpage>

    @endsection

</x-home-master>
