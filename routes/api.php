<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\InteractionController;
use App\Http\Controllers\PublicationController;
use App\Http\Controllers\StatisticsController;
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
    Route::post('signup', [AuthController::class, 'signup']);
    Route::post('login', [AuthController::class, 'login']);

    Route::group(['middleware' => 'auth:api'], function() {
        Route::get('logout', [AuthController::class, 'logout']);
    });
});

Route::group(['prefix' => 'publications'], function() {
    Route::get('/', [PublicationController::class, 'index']);
    Route::get('/{id}', [PublicationController::class, 'show']);
    Route::get('next/{id}', [PublicationController::class, 'getNext']);
    Route::get('previous/{id}', [PublicationController::class, 'getPrevious']);
    Route::group(['middleware' => ['auth:api', 'admin']], function() {
        Route::post('/', [PublicationController::class, 'store']);
        Route::put('/{id}', [PublicationController::class, 'update']);    
        Route::delete('/{id}', [PublicationController::class, 'destroy']);
    });
});

Route::group(['prefix' => 'interactions', 'middleware' => 'auth:api'], function() {
    Route::post('/add-visit', [InteractionController::class, 'addVisit']);
    Route::post('/update-like', [InteractionController::class, 'updateLike']);
});

Route::group(['prefix' => 'statistics', 'middleware' => ['auth:api', 'admin']], function() {
    Route::get('/visits-per-publications', [StatisticsController::class, 'visitsPerPublications']);
    Route::get('/publications-visits-by-users', [StatisticsController::class, 'publicationsVisitsByUsers']);
    Route::get('/publications-reactions', [StatisticsController::class, 'publicationsReactions']);
});