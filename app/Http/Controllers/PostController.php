<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class PostController extends Controller
{

    public function index(){
        $posts=Post::paginate(10);
        return view('posts.index',compact('posts'));
    }

    public function show(Post $post){

        return view('blog-post',compact('post'));
    }

    public function create(){
        return view('posts.create');
    }

    public function store(){
        $input=request()->validate([
            'title' => 'required | min: 5',
            'body' => 'required',
            'category' => 'required'
        ]);

        if(request('image')){
            $input['post_image']=request('image')->store('images/post');
        }
        else{
            $input['post_image']=null;
        }

        $post=User::find(Auth::user()->id)->posts()->create([
            'title'=> $input['title'],
            'body'=> $input['body'],
            'post_image'=> $input['post_image']
        ]);
        $post->categories()->attach($input['category']);
        session()->flash('created-message','Post was created!');

        return redirect()->route('post.index');

    }

    public function destroy(Post $post){
        $post->delete();
        Session::flash('message','Post was deleted!');
        // $request->session()->flash('message','Post deleted!');
        return back();
    }

    public function edit(Post $post){
        return view('posts.edit',compact('post'));
    }

    public function update(Post $post){
        $input=request()->validate([
            'title' => 'required | min: 5',
            'body' => 'required'
        ]);

        if(request('image')){
            $input['post_image']=request('image')->store('images/post');
            $post->post_image = $input['post_image'];
        }
        if(!$post->categories->contains(request('category'))){
            $post->categories()->attach(request('category'));
        }

        $post->title=$input['title'];
        $post->body=$input['body'];

        $this->authorize('update',$post);

        // if(auth()->user()->can('view',$post)){

        // }

        $post->update();
        session()->flash('updated-message','Post was updated!');
        return redirect()->route('post.index');
    }

    public function category($slug){
        $category=Category::whereSlug($slug)->get();
        // $category=Category::find(2);
        $posts=$category[0]->posts;
        $category_name=$category[0]->name;
        return view('posts.category-posts',compact('posts','category_name'));
    }

}
