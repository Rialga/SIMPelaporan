<?php

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

Auth::routes();
Route::get('logout', function(){
    Auth::logout();
    return redirect('login');
});

Route::group(['middleware' => ['auth', 'roles'], 'roles' => ['spkt','brigadir']], function () {
    Route::get('/home', 'HomeController@index')->name('home');
    });



Route::group(['middleware' => ['auth', 'roles'], 'roles' => ['spkt']], function () {
        Route::group(['prefix' => 'kelolauser'], function () {
            Route::get('/', function() { return view('kelolauser'); });
            Route::get('data', 'UserController@data');
            Route::post('create', 'UserController@create');
            Route::post('update/{id}', 'UserController@update');
            Route::get('delete/{id}', 'UserController@delete');
            Route::get('listrole', 'UserController@listrole');

        });
    });

Route::group(['prefix' => 'user'], function () {
    Route::get('/', function() { return view('auth.register'); });
    Route::post('create', 'UserController@create');
    Route::post('update/{id}', 'UserController@update');
    Route::post('delete/{id}', 'UserController@delete');
    Route::get('listrole', 'UserController@listrole');

});

