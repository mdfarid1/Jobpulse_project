<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubjectWiseAttendance extends Model
{
    use HasFactory;

    protected $table = 'subject_wise_attendances';

    protected $guarded = [];
    public function contact()
    {
        return $this->belongsTo('App\Contact','student_id');
    }
}
