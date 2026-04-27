<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class RekamMedikController extends Controller
{
    public function store(Request $request){
        $validate = $request->validate([
            'id_antrian' => 'required|integer',
            'id_pasien' => 'required|integer',
            'id_dokter' => 'required|integer',
            'diagnosa' => 'required|string',
            'tindakan_medis' => 'required|string'
        ]);

        // $rekam_medik = RekamMedik::create($validate)
        // Antrian::where('id', $request->id_antrian)->update(['status' => 'selesai']);
        return response()->json([
            'status' => 'success',
            'message' => 'Rekam medik pasien berhasil disimpan',
        ], 201);
    }
}
