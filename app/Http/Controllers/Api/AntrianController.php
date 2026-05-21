<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AntrianController extends Controller
{
    public function dummy(){
        $json_data = '{
  "success": true,
  "unit": "Mata",
  "tanggal": "2026-05-19",
  "data": {
    "menunggu": [],
    "pemeriksaan_awal": [
      {
        "id": 1,
        "pendaftaran_id": 1,
        "unit_id": 1,
        "tanggal": "2026-05-18T16:00:00.000000Z",
        "nomor_antrian": 1,
        "kode_antrian": "A-001",
        "status": "pemeriksaan_awal",
        "waktu_panggil": "2026-05-19T14:43:58.000000Z",
        "created_at": "2026-05-19T14:10:48.000000Z",
        "updated_at": "2026-05-19T15:21:24.000000Z",
        "pendaftaran": {
          "id": 1,
          "nomor_pendaftaran": "PEND-20260519-0001",
          "pasien_id": 1,
          "unit_id": 1,
          "tanggal_kunjungan": "2026-05-14T16:00:00.000000Z",
          "created_at": "2026-05-15T14:10:48.000000Z",
          "updated_at": "2026-05-15T14:10:48.000000Z",
          "deleted_at": null,
          "pasien": {
            "id": 1,
            "user_id": null,
            "nomor_rm": "RM-000001",
            "nik": "3201234567890001",
            "nama_lengkap": "Budi Santoso",
            "jenis_kelamin": "L",
            "tanggal_lahir": "1990-05-19T16:00:00.000000Z",
            "alamat": "Jl. Merdeka No. 1",
            "no_telepon": "08123456789",
            "jenis_pasien": "umum",
            "no_bpjs": null,
            "created_at": "2026-05-15T14:10:48.000000Z",
            "updated_at": "2026-05-15T14:10:48.000000Z",
            "deleted_at": null
          }
        }
      }
    ],
    "sedang_diperiksa": [],
    "selesai_pemeriksaan": [],
    "lunas": [],
    "obat_diserahkan": []
  },
  "statistik": {
    "total": 5,
    "menunggu": 0,
    "selesai": 0
  }
}';
        return response()->json(json_decode($json_data));
    }
}
