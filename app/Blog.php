<?php

namespace App;

use App\Models\Apply;
use App\Models\Category_circular;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Cviebrock\EloquentSluggable\SluggableScopeHelpers;

class Blog extends Model
{
//   use Sluggable;
//   use SluggableScopeHelpers;
  protected $fillable = ['user_id','title','description','blog_img'];
  public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function category_circulars()
    {
        return $this->belongsToMany(Category_circular::class);
    }


    public function applies()
    {
        return $this->hasMany(Apply::class);
    }


    // public function category_circulars()
    // {
    //     return $this->belongsTo(Category_circular::class,);
    // }
    // public function categoryCirculars()
    // {
    //     return $this->belongsTo(Category_circular::class,('id'));
    // }

}
