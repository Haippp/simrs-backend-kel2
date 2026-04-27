<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ResepController extends Controller
{
    public function store(Request $request){
        $validate = $request->validate([
            'id_rm' => 'required|integer',
            'id_antrian' => 'required|integer',
            'id_pasien' => 'required|integer',
            'id_dokter' => 'required|integer',
            'catatan_tambahan' => 'nullable|string',
            'obat' => 'required|array|min:1',
            'obat.*.id_obat' => 'required|string',
            'obat.*.dosis' => 'required|string',
            'obat.*.aturan_pakai' => 'required|string',
            'obat.*.jumlah' => 'required|integer|min:1'
        ]);

        return response()->json([
            'status' => 'succes',
            'message' => 'Resep berhasil diterbitkan dan dikirim ke Apotek'
        ], 201);
    }
}
