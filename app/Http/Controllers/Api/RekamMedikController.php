<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class RekamMedikController extends Controller
{
    /**
     * @OA\Post(
     * path="/rekam-medik",
     * operationId="storeRekamMedik",
     * tags={"Rekam Medik Dokter"},
     * summary="Simpan data rekam medik (Diagnosa & Tindakan)",
     * description="Menyimpan hasil pemeriksaan, diagnosa, dan tindakan medis yang diinput oleh dokter.",
     * @OA\RequestBody(
     * required=true,
     * @OA\JsonContent(
     * required={"id_antrian", "id_pasien", "id_dokter", "diagnosa", "tindakan_medis"},
     * @OA\Property(property="id_antrian", type="integer", example=1),
     * @OA\Property(property="id_pasien", type="integer", example=99),
     * @OA\Property(property="id_dokter", type="integer", example=5),
     * @OA\Property(property="diagnosa", type="string", example="Hipertensi Grade II"),
     * @OA\Property(property="tindakan_medis", type="string", example="Pemeriksaan EKG + Konsultasi Gizi")
     * )
     * ),
     * @OA\Response(
     * response=201,
     * description="Berhasil menyimpan data rekam medik",
     * @OA\JsonContent(
     * @OA\Property(property="status", type="string", example="success"),
     * @OA\Property(property="message", type="string", example="Rekam medik pasien berhasil disimpan")
     * )
     * ),
     * @OA\Response(response=422, description="Validasi Error")
     * )
     */
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
