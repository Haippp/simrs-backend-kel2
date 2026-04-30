<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\RekamMedik;
use Illuminate\Http\Request;

class RekamMedikController extends Controller
{
    public function store(Request $request){
        $validate = $request->validate([
            'id_asesmen' => 'required|integer',
            'id_dokter' => 'required|integer',
            'id_antrian' => 'required|integer',
            'id_pasien' => 'required|integer',
            'diagnosa' => 'required|string',
            'tindakan_medis' => 'required|string'
        ]);

        $rm = RekamMedik::create($validate);

        return response()->json([
            'status' => 'success',
            'message' => 'Rekam medik pasien berhasil disimpan',
        ], 201);
    }

    public function riwayat($id_pasien){
        $riwayat = RekamMedik::where('id_pasien', $id_pasien);

        if(!$riwayat) {
            return response()->json([
                'status' => 'error',
                'message' => 'Riwayat rekam-medik untuk pasien ini tidak ditemukan atau belum diinput'
            ], 404);
        }

        return response()->json([
            'status' => 'success',
            'message' => "Riwayat rekam medik dari pasien : $id_pasien",
            'data' => $riwayat
        ]);
    }
}
