<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use GrahamCampbell\ResultType\Success;
use Illuminate\Http\Request;

class AsesmenController extends Controller
{
    public function show($id_antrian){
        // $asesmen = Asesmen::where('id_antrian', $id_antrian)->first();

        if(true /** $asesmen */) {
            return response()->json([
                'status' => 'error',
                'message' => 'Data asesmen untuk antrian ini tidak ditemukan atau belum diinput'
            ], 404);
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Data asesmen  berhasil ditemukan',
            'data' => ""// $asesmen
        ]);
    }

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
