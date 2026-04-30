<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RekamMedik extends Model
{
    use HasFactory;
    protected $table = 'rekam_medik';
    protected $primaryKey = 'id_rm';

    protected $fillable = [
        'id_dokter', 'id_asesmen', 'id_antrian',
        'id_pasien', 'diagnosa', 'kode_icd'
    ];

    public function dokter(){
        return $this->belongsTo(Dokter::class, 'id_dokter', 'id_dokter');
    }

    public function asesmen(){
        return $this->belongsTo(Asesmen::class, 'id_asesmen', 'id_asesmen');
    }
}
