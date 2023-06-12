<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    // protected $fillable=['user_id','title','post_image','body'];
    protected $guarded=[];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function getPostImageAttribute($value){
        if(str_contains($value,'images/post')){
            return asset('storage/' . $value);
        }
        else{
            return asset($value);
        }
    }

    public function categories(){
        return $this->belongsToMany(Category::class);
    }

}
