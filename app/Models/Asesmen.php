<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Asesmen extends Model
{
    use HasFactory;

    protected $table = 'asesmen';
    protected $primaryKey = 'id_asesmen';

    protected $fillable = [
        'id_perawat', 'id_antrian', 'id_pasien', 'keluhan_utama', 
        'alergi', 'tensi', 'suhu', 'tinggi_badan', 'berat_badan', 
        'nadi', 'respirasi'
    ];

    public function rekamMedik()
    {
        return $this->hasOne(RekamMedik::class, 'id_asesmen', 'id_asesmen');
    }
}