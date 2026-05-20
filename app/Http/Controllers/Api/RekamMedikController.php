<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\RekamMedik;
use Illuminate\Http\Request;

/**
 * @tags Rekam Medik
 */
class RekamMedikController extends Controller
{
    /**
     * Simpan rekam medik pasien.
     *
     * Endpoint ini mencatat diagnosa dan tindakan medis pasien ke rekam medik.
     * Data rekam medik akan disimpan dengan referensi asesmen, dokter, antrian, dan pasien.
     */
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

    /**
     * Riwayat rekam medik pasien.
     *
     * Endpoint ini mengambil semua rekam medik berdasarkan id_pasien.
     * Cocok untuk melihat histori diagnosa dan tindakan medis pasien.
     *
     * @param int $id_pasien ID pasien untuk mengambil riwayat.
     */
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
