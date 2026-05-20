<?php
use App\Http\Controllers\API\AntrianController;
use App\Http\Controllers\API\DokterController;
use App\Http\Controllers\API\PerawatController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AsesmenController;
use App\Http\Controllers\Api\RekamMedikController;
use App\Http\Controllers\Api\ResepController;

Route::get('/antrian', [AntrianController::class, 'dummy']);

Route::get('/asesmen', [AsesmenController::class, 'index']);
Route::get('/asesmen/today', [AsesmenController::class, 'today']);
Route::get('/asesmen/{id_antrian}', [AsesmenController::class, 'show']);
Route::post('/asesmen', [AsesmenController::class, 'store']);

Route::get('/dokter', [DokterController::class, 'index']);
Route::get('/dokter/{id_dokter}', [DokterController::class,'show']);
Route::get('/dokter/{id_dokter}/biaya', [DokterController::class,'biaya']);
Route::post('/dokter', [DokterController::class, 'store']);

Route::get('/perawat', [PerawatController::class, 'index']);
Route::get('/perawat/{id_perawat}', [PerawatController::class, 'show']);
Route::get('/perawat/{id_perawat}/biaya', [PerawatController::class, 'biaya']);
Route::post('/perawat', [PerawatController::class, 'store']);

Route::get('/rekam-medik', [RekamMedikController::class, 'index']);
Route::get('/rekam-medik/{$id_rm}', [RekamMedikController::class, 'show']);
Route::get('/rekam-medik/pasien/{id_pasien}', [RekamMedikController::class, 'riwayat']);
Route::post('/rekam-medik', [RekamMedikController::class, 'store']);

Route::post('/resep', [ResepController::class, 'store']);
Route::delete('/resep/id', [ResepController::class, 'destroy']);