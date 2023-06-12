<?php

use App\Models\Post;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Auth::routes();

Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('/blog', [App\Http\Controllers\HomeController::class, 'index'])->name('blog');

Route::get('/post/{post}', [App\Http\Controllers\PostController::class, 'show'])->name('post');

Route::get('/posts/category/{slug}', [App\Http\Controllers\PostController::class, 'category'])->name('post.category.show');

Route::middleware('auth')->group(function(){
    Route::get('/admin', [App\Http\Controllers\AdminsController::class, 'index'])->name('admin.index');
    Route::get('/admin/chart', [App\Http\Controllers\AdminsController::class, 'index'])->name('admin.chart');
    Route::get('/admin/posts', [App\Http\Controllers\PostController::class, 'index'])->name('post.index');
    Route::get('/admin/posts/create', [App\Http\Controllers\PostController::class, 'create'])->name('post.create');
    Route::post('/admin/posts', [App\Http\Controllers\PostController::class, 'store'])->name('post.store');
    Route::delete('/admin/posts/{post}/delete', [App\Http\Controllers\PostController::class, 'destroy'])->name('post.destroy');
    Route::get('/admin/posts/{post}/edit', [App\Http\Controllers\PostController::class, 'edit'])->name('post.edit');
    Route::patch('/admin/posts/{post}/update', [App\Http\Controllers\PostController::class, 'update'])->name('post.update');
    Route::get('/admin/users/{user}/profile',[App\Http\Controllers\UserController::class,'show'])->name('user.profile.show');
    Route::put('/admin/users/{user}/update',[App\Http\Controllers\UserController::class,'update'])->name('user.profile.update');

    Route::delete('/admin/users/{user}/delete',[App\Http\Controllers\UserController::class,'destroy'])->name('user.destroy');

    Route::get('/admin/404',function(){
        return view('admin.404');
    });

});

Route::middleware('role:admin')->group(function(){

    Route::get('/admin/users/',[App\Http\Controllers\UserController::class,'index'])->name('user.index');
    Route::get('/admin/users/{user}/roles',[App\Http\Controllers\RoleController::class,'show'])->name('user.roles');
    Route::put('/admin/users/{user}/roles/attach',[App\Http\Controllers\UserController::class,'attach'])->name('user.role.attach');
    Route::put('/admin/users/{user}/roles/detach',[App\Http\Controllers\UserController::class,'detach'])->name('user.role.detach');
    Route::get('/admin/roles',[App\Http\Controllers\RoleController::class,'index'])->name('role.index');
    Route::get('/admin/permission',[App\Http\Controllers\PermissionController::class,'index'])->name('permission.index');
    Route::post('/admin/role/create',[App\Http\Controllers\RoleController::class,'store'])->name('role.store');
    Route::delete('/admin/role/{role}/delete',[App\Http\Controllers\RoleController::class,'destroy'])->name('role.destroy');
    Route::get('/admin/role/{role}/edit',[App\Http\Controllers\RoleController::class,'edit'])->name('role.edit');
    Route::put('/admin/role/{role}/update',[App\Http\Controllers\RoleController::class,'update'])->name('role.update');
    Route::put('/admin/role/{role}/permission/attach',[App\Http\Controllers\RoleController::class,'attach'])->name('permission.attach');
    Route::put('/admin/role/{role}/permission/detach',[App\Http\Controllers\RoleController::class,'detach'])->name('permission.detach');
    Route::delete('/admin/permission/{permission}/delete',[App\Http\Controllers\PermissionController::class,'destroy'])->name('permission.destroy');
    Route::post('/admin/permission/create',[App\Http\Controllers\PermissionController::class,'store'])->name('permission.store');
    Route::get('/admin/post/category',[App\Http\Controllers\CategoryController::class,'index'])->name('category.index');
    Route::delete('/admin/post/category/{category}/delete',[App\Http\Controllers\CategoryController::class,'destroy'])->name('category.destroy');
    Route::post('/admin/post/category/create',[App\Http\Controllers\CategoryController::class,'store'])->name('category.store');

});


// Route::get('/admin/posts/{post}/edit', [App\Http\Controllers\PostController::class, 'edit'])->middleware('can:view,post')->name('post.edit');


// php artisan storage:link
// php artisan make:policy PostPolicy --model=Post
// php artisan vendor:publish


