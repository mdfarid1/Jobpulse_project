<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
    //

    protected $table = 'attendances';

    protected $guarded = []; 
    public function contact()
    {
        return $this->belongsTo('App\Contact','student_id');
    }
}
