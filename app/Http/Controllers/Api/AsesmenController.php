<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use GrahamCampbell\ResultType\Success;
use Illuminate\Http\Request;

class AsesmenController extends Controller
{
    /**
     * @OA\Post(
     * path="/asesmen",
     * operationId="storeAsesmen",
     * tags={"Asesmen Perawat"},
     * summary="Sipman data asesmen awal (TTV)",
     * description="Menyimpan data keluhan, tensi, suhu yang diinput oleh perawat.",
     * @OA\RequestBody(
     * required=true,
     * @OA\JsonContent(
     * required={"id_antrian", "id_pasien", "keluhan_utama", "tensi", "suhu", "nadi", "respirasi", "tinggi_badan", "berat_badan"},
     * @OA\Property(property="id_antrian", type="integer", example=1),
     * @OA\Property(property="id_pasien", type="integer", example=99),
     * @OA\Property(property="keluhan_utama", type="string", example="Nyeri dada"),
     * @OA\Property(property="tensi", type="string", example="120/80"),
     * @OA\Property(property="suhu", type="number", format="float", example=36.4),
     * @OA\Property(property="nadi", type="integer", example=80),
     * @OA\Property(property="respirasi", type="integer", example=20),
     * @OA\Property(property="tinggi_badan", type="number", format="float", example=165.6),
     * @OA\Property(property="berat_badan", type="number", format="float", example=55.5),
     * )
     * ),
     * @OA\Response(
     * response=201,
     * description="Berhasil menyimpan data"),
     * @OA\Response(response=422, description="Validasi Error")
     * )
     */
    public function store(Request $request){
        $validate = $request->validate([
            'id_antrian' => 'required|integer',
            'id_pasien' => 'required|integer',
            'keluhan_utama' => 'required|string',
            'tensi' => 'required|string',
            'suhu' => 'required|numeric|between:0,45',
            'nadi' => 'required|integer|min:0',
            'tinggi_badan' => 'required|numeric|min:0',
            'berat_badan' => 'required|numeric|min:0'
        ]);

        // $asesmen = Asesmen::create($validate)

        return response()->json([
            'status' => 'success',
            'message' => 'Data asesmen awal berhasil disimpan'
        ], 201);
    }
}
