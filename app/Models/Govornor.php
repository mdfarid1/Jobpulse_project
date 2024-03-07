<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Govornor extends Model
{
    use HasFactory;
    protected $table='governors';
    protected $fillable=[
        'name','title','img','created_at',
        'updated_at'
    ];
}
