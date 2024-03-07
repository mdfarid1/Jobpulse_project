<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class InstituteClass extends Model
{
    public function group()
    {
        return $this->hasOne('App\ContactGroup','id','group_id')->withDefault();
    }
}
