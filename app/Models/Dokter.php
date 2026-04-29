<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Dokter extends Model
{
    public $timestamps = false;
    protected $table = 'dokter';
    protected $primaryKey = 'id_dokter';

    protected $fillable = ['id_user', 'nama_dokter', 'spesialisasi'];
}
