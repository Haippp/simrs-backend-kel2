<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DetailEResep extends Model
{
    protected $table = 'detail_e_resep';
    protected $primaryKey = 'id_detail';

    protected $fillable = [
        'id_resep', 'id_obat', 'nama_obat', 'dosis', 'aturan_pakai',
        'jumlah'
    ];

    public function eResep(){
        return $this->belongsTo(EResep::class, 'id_resep', 'id_resep');
    }
}
