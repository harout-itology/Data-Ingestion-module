<?php

use App\Http\Controllers\YouTubeVideoController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\YouTubeReportTypeController;
use App\Http\Controllers\YouTubeJobController;
use App\Http\Controllers\YouTubeGroupController;
use App\Http\Controllers\YouTubeQueryController;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/youtube/video/{id}', [YouTubeVideoController::class, 'show']);

Route::get('/youtube/reporttype', [YouTubeReportTypeController::class, 'index']);

Route::get('/youtube/query', [YouTubeQueryController::class, 'query']);

Route::resource('/youtube/job',YouTubeJobController::class);
Route::resource('/youtube/group',YouTubeGroupController::class);
