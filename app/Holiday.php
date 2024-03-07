<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Holiday extends Model
{
    protected $table = 'holidays';

    // public function setStartDateAttribute($value)
    // {
    //     return Carbon::parse($value)->format('Y-m-d');
    // }

}
