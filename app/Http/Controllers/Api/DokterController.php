<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Dokter;
use Illuminate\Http\Request;

/**
 * @tags Dokter
 */
class DokterController extends Controller
{
    /**
     * Tampilkan semua data dokter.
     *
     * Endpoint ini menampilkan daftar dokter yang tersedia di sistem.
     * Hasilnya di-return dalam format JSON.
     */
    public function index(){
        $dokter = Dokter::all();

        return response()->json([
            'status' => 'success',
            'message' => 'List data Dokter',
            'data' => $dokter
        ]);
    }

    /**
     * Detail dokter berdasarkan ID.
     *
     * Endpoint ini mengambil data dokter lengkap berdasarkan id_dokter.
     * Akan mengembalikan error jika dokter tidak ditemukan.
     *
     * @param int $id_dokter ID dokter yang dicari.
     */
    public function show($id_dokter){
        $dokter = Dokter::findOrFail($id_dokter);

        return response()->json([
            'status' => 'success',
            'message' => "Data dokter dari id dokter : $id_dokter",
            'data' => $dokter
        ]);
    }

    /**
     * Tambahkan dokter baru.
     *
     * Endpoint ini menyimpan data dokter baru ke tabel dokter.
     * Pastikan id_user unik agar tidak terjadi duplikasi.
     */
    public function store(Request $request){
        $validate = $request->validate([
            'id_user' => 'required|integer|unique:dokter,id_dokter',
            'nama_dokter' => 'required|string|max:50',
            'spesialisasi' => 'required|string|max:30'
        ]);

        $dokter = Dokter::create($validate);

        return response()->json([
            'status' => 'success',
            'message' => 'Data dokter telah berhasil di tambahkan',
            'data' => $dokter
        ]);
    }

    /**
     * Cek biaya layanan dokter.
     *
     * Endpoint ini mengembalikan nilai biaya layanan untuk dokter tertentu.
     * Berguna untuk modul billing atau penawaran biaya pasien.
     *
     * @param int $id_dokter ID dokter untuk cek biaya.
     */
    public function biaya($id_dokter){
        $biaya = Dokter::select('biaya_layanan')->findOrFail($id_dokter);

        return response()->json([
            'status' => 'success',
            'message' => "Data dokter dari id dokter : $id_dokter",
            'data' => $biaya
        ]);
    }
}
