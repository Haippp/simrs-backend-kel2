<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EResep extends Model
{
    protected $table = 'e_resep';
    protected $primaryKey = 'id_resep';

    protected $fillable = [
        'id_rm', 'id_dokter', 'id_antrian', 'id_pasien',
        'catatan_tambahan', 'status_resep'
    ];

    public function detailEResep(){
        return $this->hasMany(DetailEResep::class, 'id_resep', 'id_resep');
    }
}
