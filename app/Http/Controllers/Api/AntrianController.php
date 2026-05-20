<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AntrianController extends Controller
{
    public function dummy(){
        $json_data = '{
  "success": true,
  "tanggal": "2026-05-15",
  "data": {
    "1": [
      {
        "id": 1,
        "pendaftaran_id": 1,
        "unit_id": 1,
        "tanggal": "2026-05-14T16:00:00.000000Z",
        "nomor_antrian": 1,
        "kode_antrian": "A-001",
        "status": "dipanggil",
        "waktu_panggil": "2026-05-15T10:01:25.000000Z",
        "created_at": "2026-05-15T10:00:36.000000Z",
        "updated_at": "2026-05-15T10:01:26.000000Z",
        "pendaftaran": {
          "id": 1,
          "nomor_pendaftaran": "PEND-20260515-0001",
          "pasien_id": 1,
          "unit_id": 1,
          "tanggal_kunjungan": "2026-05-14T16:00:00.000000Z",
          "created_at": "2026-05-15T10:00:36.000000Z",
          "updated_at": "2026-05-15T10:00:36.000000Z",
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
            "created_at": "2026-05-15T10:00:36.000000Z",
            "updated_at": "2026-05-15T10:00:36.000000Z",
            "deleted_at": null
          }
        },
        "unit": {
          "id": 1,
          "kode_unit": "A",
          "nama_unit": "Mata",
          "deskripsi": null,
          "is_active": true,
          "created_at": "2026-05-15T02:08:03.000000Z",
          "updated_at": "2026-05-15T02:08:03.000000Z"
        }
      }
    ],
    "2": [
      {
        "id": 2,
        "pendaftaran_id": 2,
        "unit_id": 2,
        "tanggal": "2026-05-14T16:00:00.000000Z",
        "nomor_antrian": 1,
        "kode_antrian": "B-001",
        "status": "menunggu",
        "waktu_panggil": null,
        "created_at": "2026-05-15T10:14:11.000000Z",
        "updated_at": "2026-05-15T10:14:11.000000Z",
        "pendaftaran": {
          "id": 2,
          "nomor_pendaftaran": "PEND-20260515-0002",
          "pasien_id": 2,
          "unit_id": 2,
          "tanggal_kunjungan": "2026-05-14T16:00:00.000000Z",
          "created_at": "2026-05-15T10:14:11.000000Z",
          "updated_at": "2026-05-15T10:14:11.000000Z",
          "deleted_at": null,
          "pasien": {
            "id": 2,
            "user_id": null,
            "nomor_rm": "RM-000002",
            "nik": "3201234567890002",
            "nama_lengkap": "John Doe",
            "jenis_kelamin": "L",
            "tanggal_lahir": "2020-01-22T16:00:00.000000Z",
            "alamat": "Jl. Mantuil",
            "no_telepon": "08987654321",
            "jenis_pasien": "umum",
            "no_bpjs": null,
            "created_at": "2026-05-15T10:14:11.000000Z",
            "updated_at": "2026-05-15T10:14:11.000000Z",
            "deleted_at": null
          }
        },
        "unit": {
          "id": 2,
          "kode_unit": "B",
          "nama_unit": "Gigi",
          "deskripsi": null,
          "is_active": true,
          "created_at": "2026-05-15T02:08:03.000000Z",
          "updated_at": "2026-05-15T02:08:03.000000Z"
        }
      }
    ]
  }
}';
        return response()->json(json_decode($json_data));
    }
}
