<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\PublicationController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['prefix' => 'auth'], function() {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('singup', [AuthController::class, 'singup']);

    Route::group(['middleware' => 'auth:api'], function() {
        Route::get('logout', [AuthController::class, 'logout']);
    });
});

Route::group(['prefix' => 'publications'], function() {
    Route::get('/', [PublicationController::class, 'index'])->name('publications');
    Route::get('/{id}', [PublicationController::class, 'show']);
    Route::group(['middleware' => ['auth:api', 'admin']], function() {
        Route::post('/', [PublicationController::class, 'store']);
        Route::put('/{id}', [PublicationController::class, 'update']);    
        Route::delete('/{id}', [PublicationController::class, 'destroy']);
    });
});