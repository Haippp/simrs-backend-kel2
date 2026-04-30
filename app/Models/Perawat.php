<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Perawat extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'perawat';
    protected $primaryKey = 'id_perawat';

    protected $fillable = ['id_unit', 'id_user', 'nama_perawat'];

    public function asesmen(){
        return $this->HasMany(Asesmen::class, 'id_perawat', 'id_perawat');
    }
}
