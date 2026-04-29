<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Dokter;
use Illuminate\Http\Request;

class DokterController extends Controller
{
    public function index(){
        $dokter = Dokter::all();

        return response()->json([
            'status' => 'success',
            'message' => 'List data Dokter',
            'data' => $dokter
        ]);
    }
    public function show($id_dokter){
        $dokter = Dokter::findOrFail($id_dokter);

        return response()->json([
            'status' => 'success',
            'message' => "Data perawat dari id dokter : $id_dokter",
            'data' => $dokter
        ]);
    }
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
}
