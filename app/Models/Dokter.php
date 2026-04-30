<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dokter extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'dokter';
    protected $primaryKey = 'id_dokter';

    protected $fillable = ['id_user', 'nama_dokter', 'spesialisasi'];

    public function rekamMedik()
    {
        return $this->hasMany(RekamMedik::class, 'id_dokter', 'id_dokter');
    }
}
