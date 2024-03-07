<?php

namespace App\Models;

use App\Blog;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category_circular extends Model
{
    use HasFactory;
  protected $fillable = ['name'];

  public function blogs()
  {
      return $this->hasMany(Blog::class);
  }



  public function applies()
  {
      return $this->hasMany(Apply::class);
  }
}
