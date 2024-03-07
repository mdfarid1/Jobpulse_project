<?php

namespace App\Models;

use App\Blog;
use App\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Apply extends Model
{
    use HasFactory;
  protected $fillable = ['name','email','phone','dof','bio',';cv','jobid','status'];



  public function blog()
  {
      return $this->belongsTo(Blog::class);
  }

  public function category_circulars()
  {
      return $this->belongsTo(Category_circular::class);
  }
  public function user()
    {
        return $this->belongsTo(User::class);
    }

    // public function blog()
    // {
    //     return $this->belongsTo(Blog::class);
    // }

}
