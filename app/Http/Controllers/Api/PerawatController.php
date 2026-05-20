<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Perawat;
use Illuminate\Http\Request;

class PerawatController extends Controller
{
    public function index(){
        $perawat = Perawat::all();
        return response()->json([
            'status' => 'success',
            'message' => 'List data Perawat',
            'data' => $perawat
        ], 200);
    }
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
    public function show($id_perawat){
        $perawat = Perawat::findOrFail($id_perawat);

        return response()->json([
            'status' => 'success',
            'message' => "Data perawat dari id perawat : $id_perawat",
            'data' => $perawat
        ]);
    }
    public function biaya($id_perawat){
        $biaya = Perawat::select('biaya_layanan')->findOrFail($id_perawat);

        return response()->json([
            'status' => 'success',
            'message' => "Data perawat dari id perawat : $id_perawat",
            'data' => $biaya
        ]);
    }
}
