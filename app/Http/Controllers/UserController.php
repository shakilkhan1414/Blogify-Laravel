<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{

    public function index(){
        $users=User::paginate(10);
        return view('user.index',compact('users'));
    }

    public function show(User $user){
        return view('user.profile',compact('user'));
    }

    public function update(User $user){

        $inputs=request()->validate([
            'username'=> ['required','string','max:255','alpha_dash'],
            'name'=> ['required','string','max:255'],
            'email'=> ['required','email','max:255'],
            'avatar'=>['file']
        ]);

        if(request('avatar')){
            $inputs['avatar']=request('avatar')->store('images/user');
        }

        $user->update($inputs);

        session()->flash('update-user','Profile was updated!');

        return back();

    }

    public function destroy(User $user){
        $user->delete();
        session()->flash('delete-user-message','User was deleted!');
        return back();
    }

    public function attach(User $user){
        $user->roles()->attach(request('role'));
        session()->flash('attach-message','Role attached!');
        return back();
    }

    public function detach(User $user){
        $user->roles()->detach(request('role'));
        session()->flash('detach-message','Role detached!');
        return back();
    }


}
