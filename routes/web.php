<?php

use Illuminate\Support\Facades\Route;
use Laravel\Socialite\Facades\Socialite;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/oauth2/google', function () {
    return Socialite::driver('google')
        ->scopes(config('youtube.scopes'))
        ->redirect();
});

Route::get('/oauth2/callback', function () {
    $user = Socialite::driver('google')->user();
    return response()->json($user->token);
});
