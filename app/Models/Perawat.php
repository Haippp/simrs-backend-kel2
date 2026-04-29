<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Perawat extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'perawat';
    protected $primaryKey = 'id_perawat';

    protected $fillable = ['id_unit', 'id_user', 'nama_perawat'];

    
}
