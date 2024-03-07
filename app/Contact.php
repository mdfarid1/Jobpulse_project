<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'contacts';

    protected $guarded = [];

	public function group()
    {
        return $this->hasOne('App\ContactGroup','id','group_id')->withDefault();
    }

	public function user()
    {
        return $this->belongsTo('App\User')->withDefault();
    }

    public function company()
    {
        return $this->belongsTo('App\Company','company_id')->withDefault();
    }

    public function class()
    {
        return $this->belongsTo('App\InstituteClass','class_id')->withDefault();
    }

    public function attendance()
    {
        return $this->belongsTo('App\Attendance','student_id')->withDefault();
    }

    public function projects()
    {
        return $this->hasMany('App\Project','client_id');
    }

}
