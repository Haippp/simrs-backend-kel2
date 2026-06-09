<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Asesmen;
use Illuminate\Http\Request;

/**
 * @tags Asesmen
 */
class AsesmenController extends Controller
{
    /**
     * Tampilkan semua data asesmen.
     *
     * Endpoint ini mengambil semua catatan asesmen yang tersimpan.
     * Berguna untuk melihat daftar asesmen pasien secara keseluruhan.
     */
    public function index(){
        $asesmen = Asesmen::all();
        return response()->json([
            'status' => 'success',
            'message' => 'List data asesmen',
            'data' => $asesmen
        ], 200);
    }

    /**
     * Detail asesmen berdasarkan id antrian.
     *
     * Endpoint ini mencari satu data asesmen dari id antrian tertentu.
     * Jika data tidak ditemukan, akan mengembalikan pesan error.
     *
     * @param int $id_antrian ID antrian yang ingin dicari.
     */
    public function show($id_antrian){
        $asesmen = Asesmen::where('id_antrian', $id_antrian)->first();

        if(!$asesmen) {
            return response()->json([
                'status' => 'error',
                'message' => 'Data asesmen untuk antrian ini tidak ditemukan atau belum diinput'
            ], 404);
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Data asesmen berhasil ditemukan',
            'data' => $asesmen
        ]);
    }

    /**
     * Tampilkan semua asesmen hari ini.
     *
     * Endpoint ini mengambil semua data asesmen yang dibuat pada tanggal hari ini.
     * Cocok untuk melihat asesmen pasien pada shift saat ini.
     */
    public function today(){
        $asesmen_hari_ini = Asesmen::whereDate('created_at', now()->toDateString())->get();
        
        if(!$asesmen_hari_ini) {
            return response()->json([
                'status' => 'error',
                'tanggal' => today(),
                'message' => 'Data asesmen untuk antrian ini tidak ditemukan atau belum diinput'
            ], 404);
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Data asesmen hari ini berhasil ditemukan',
            'tanggal' => today(),
            'data' => $asesmen_hari_ini
        ]);
    }

    /**
     * Simpan asesmen awal pasien.
     *
     * Endpoint ini menyimpan data awal asesmen pasien termasuk keluhan utama,
     * tensi, suhu, nadi, tinggi badan, dan berat badan.
     */
    public function store(Request $request){
        $validate = $request->validate([
            'id_perawat' => 'required|integer',
            'id_antrian' => 'required|integer',
            'id_pasien' => 'required|integer',
            'alergi' => 'nullable|string',
            'keluhan_utama' => 'required|string',
            'tensi' => 'required|string',
            'suhu' => 'required|numeric|between:0,45',
            'nadi' => 'required|integer|min:0',
            'respirasi'   => 'required|integer|between:8,60',
            'tinggi_badan' => 'required|numeric|min:0',
            'berat_badan' => 'required|numeric|min:0'
        ]);

        $asesmen = Asesmen::create($validate);

        return response()->json([
            'status' => 'success',
            'message' => 'Data asesmen awal berhasil disimpan',
            'data' => $asesmen
        ], 201);
    }
}
