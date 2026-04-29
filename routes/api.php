<?php
use App\Http\Controllers\API\PerawatController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AsesmenController;
use App\Http\Controllers\Api\RekamMedikController;
use App\Http\Controllers\Api\ResepController;

Route::get('/asesmen/{id_antrian}', [AsesmenController::class, 'show']);
Route::post('/asesmen', [AsesmenController::class, 'store']);

Route::get('/perawat', [PerawatController::class, 'index']);
Route::get('/perawat/{id_perawat}', [PerawatController::class, 'show']);
Route::post('/perawat', [PerawatController::class, 'store']);

Route::post('/rekam-medik', [RekamMedikController::class, 'store']);

Route::post('/resep', [ResepController::class, 'store']);
Route::delete('/resep/id', [ResepController::class, 'destroy']);