<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CategoryController extends Controller
{
    public function index(){
        $categories=Category::all();
        return view('category.index',compact('categories'));
    }

    public function destroy(Category $category){
        $category->delete();
        session()->flash('category-delete','Category deleted!');
        return back();
    }

    public function store(){
        $inputs=request()->validate([
            'name'=>'required'
        ]);

        $slug=Str::lower(request('name'));
        $inputs['slug']=Str::replace(" ","-",$slug);

        Category::create($inputs);
        session()->flash('add-category-message','Category added!');
        return back();
    }

}
