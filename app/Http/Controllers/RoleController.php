<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class RoleController extends Controller
{

    public function index(){
        $roles=Role::all();
        return view('role.index',compact('roles'));
    }

    public function store(){
        $inputs=request()->validate([
            'name'=>'required'
        ]);

        $slug=Str::lower(request('name'));
        $inputs['slug']=Str::replace(" ","-",$slug);

        Role::create($inputs);
        session()->flash('add-role-message','Role added!');
        return back();
    }

    public function destroy(Role $role){
        session()->flash('role-delete','Role deleted!');
        $role->delete();
        return back();
    }

    public function edit(Role $role){
        $permissions=Permission::all();
        return view('role.edit',compact('role','permissions'));
    }

    public function show(User $user){
      $roles=Role::all();
      return view('user.roles',compact('roles','user'));
    }

    public function update(Role $role){
        $inputs=request()->validate([
            'name'=>'required'
        ]);

        $slug=Str::lower(request('name'));
        $inputs['slug']=Str::replace(" ","-",$slug);

        $role->name=$inputs['name'];
        $role->slug=$inputs['slug'];

        if ($role->isDirty('name')){
            session()->flash('role-update','Role updated!');
            $role->save();
        }
        else{
            session()->flash('role-update','Nothing to update!');
        }

        return back();
    }

    public function attach(Role $role){
        $role->permissions()->attach(request('permission'));
        session()->flash('attach-message','Permission attached!');
        return back();
    }

    public function detach(Role $role){
        $role->permissions()->detach(request('permission'));
        session()->flash('detach-message','Permission detached!');
        return back();
    }


}
