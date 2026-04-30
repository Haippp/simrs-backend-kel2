<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\EResep;
use App\Models\DetailEResep;

class ResepController extends Controller
{
    public function store(Request $request){
        $validated = $request->validate([
            'id_rm' => 'required|integer|exists:rekam_medik,id_rm',
            'id_antrian' => 'required|integer',
            'id_pasien' => 'required|integer',
            'id_dokter' => 'required|integer|exists:dokter,id_dokter',
            'catatan_tambahan' => 'nullable|string',
            'obat' => 'required|array|min:1',
            'obat.*.id_obat' => 'required|integer',
            'obat.*.dosis' => 'required|string',
            'obat.*.aturan_pakai' => 'required|string',
            'obat.*.jumlah' => 'required|integer|min:1'
        ]);

        $resep = EResep::create([
            'id_rm' => $validated['id_rm'],
            'id_antrian' => $validated['id_antrian'],
            'id_pasien' => $validated['id_pasien'],
            'id_dokter' => $validated['id_dokter'],
            'catatan_tambahan' => $validated['catatan_tambahan'] ?? null,
            'status_resep' => 'diterbitkan'
        ]);

        foreach ($validated['obat'] as $item) {
            DetailEResep::create([
                'id_resep' => $resep->id_resep,
                'id_obat' => $item['id_obat'],
                'dosis' => $item['dosis'],
                'aturan_pakai' => $item['aturan_pakai'],
                'jumlah' => $item['jumlah'],
            ]);
        }

        return response()->json([
            'status' => 'succes',
            'message' => 'Resep berhasil diterbitkan dan dikirim ke Apotek'
        ], 201);
    }
}
