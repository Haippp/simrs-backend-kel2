<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AntrianController;
use App\Http\Controllers\Api\AsesmenController;
use App\Http\Controllers\Api\RekamMedikController;
use App\Http\Controllers\Api\ResepController;

Route::get('/antrian/{id_poli}', [AntrianController::class, 'index']);
Route::patch('/antrian/{id}/panggil',[AntrianController::class, 'panggil']);

Route::post('/asesmen', [AsesmenController::class, 'store']);
Route::post('/Diagnosa', [RekamMedikController::class, 'store']);

Route::post('/resep', [ResepController::class, 'store']);
Route::delete('/resep/id', [ResepController::class, 'destroy']);

Route::get('/tagihan', [RekamMedikController::class, 'lihatTagihan']);