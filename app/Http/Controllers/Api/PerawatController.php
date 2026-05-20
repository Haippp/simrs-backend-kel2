<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Perawat;
use Illuminate\Http\Request;

/**
 * @tags Perawat
 */
class PerawatController extends Controller
{
    /**
     * Tampilkan semua data perawat
     *
     * Endpoint ini mengambil daftar seluruh perawat yang terdaftar di sistem.
     * Hasilnya dikirimkan dalam format JSON dengan status operasi.
     */
    public function index(){
        $perawat = Perawat::all();
        return response()->json([
            'status' => 'success',
            'message' => 'List data Perawat',
            'data' => $perawat
        ], 200);
    }

    /**
     * Tambahkan perawat baru
     *
     * Endpoint ini menyimpan data perawat baru ke database.
     * Data yang valid mencakup unit, id_user unik, dan nama perawat.
     */
    public function store(Request $request){
        $validate = $request->validate([
            'id_unit' => 'required|integer',
            'id_user' => 'required|integer|unique:perawat,id_perawat',
            'nama_perawat' => 'required|string|max:30'
        ]);

        $perawat = Perawat::create($validate);

        return response()->json([
            'status' => 'success',
            'message' => 'Data perawat telah berhasil di tambahkan',
            'data' => $perawat
        ], 201);
    }

    /**
     * Detail data perawat
     *
     * Endpoint ini mengambil informasi lengkap satu perawat berdasarkan id_perawat.
     * Jika perawat tidak ditemukan, response akan berisi error 404.
     *
     * @param int $id_perawat ID dari perawat yang ingin dicari.
     */
    public function show($id_perawat){
        $perawat = Perawat::findOrFail($id_perawat);

        return response()->json([
            'status' => 'success',
            'message' => "Data perawat dari id perawat : $id_perawat",
            'data' => $perawat
        ]);
    }

    /**
     * Cek biaya layanan perawat
     *
     * Endpoint ini mengembalikan nilai biaya layanan perawat berdasarkan id_perawat.
     * Cocok digunakan untuk modul kasir atau perhitungan biaya rumah sakit.
     *
     * @param int $id_perawat ID dari perawat untuk dicek biaya jasanya.
     */
    public function biaya($id_perawat){
        $biaya = Perawat::select('biaya_layanan')->findOrFail($id_perawat);

        return response()->json([
            'status' => 'success',
            'message' => "Data perawat dari id perawat : $id_perawat",
            'data' => $biaya
        ]);
    }
}