<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', 'HomeController@showWelcome');

Route::api(['version' => 'v1'], function () {
    Route::group(['prefix' => 'user'], function () {
		Route::post('register', 'Api\V1\UserController@register');
		Route::post('login', 'Api\V1\UserController@login');
		
		Route::group(['before' => 'jwt.auth'], function () {
			Route::get('logout', 'Api\V1\UserController@logout');
		});
    });
	
    Route::group(['prefix' => 'products'], function () {
		Route::group(['before' => 'jwt.auth'], function () {
			Route::get('/{limit?}/{offset?}', 'Api\V1\ProductController@products');
		});
    });
	
    Route::group(['prefix' => 'product'], function () {
		Route::group(['before' => 'jwt.auth'], function () {
			Route::get('/{swipe}/{productId}', 'Api\V1\ProductController@swipe');
		});
		Route::group(['before' => 'jwt.auth.admin'], function () {
			Route::get('/scrape', 'Api\V1\ProductController@scrape');
		});
    });
	
	
});