<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RekamMedik extends Model
{
    protected $table = 'rekam_medik';
    protected $primaryKey = 'id_rm';

    protected $fillable = [
        'id_dokter', 'id_asesmen', 'id_antrian',
        'id_pasien', 'diagnosa', 'kode_icd'
    ];
}
