<?php
namespace Api\V1;

class UserController extends ApiBaseController {

	public function register()
	{
		// Restrict input
		$input = \Input::only('username', 'email', 'password');

		// Set validation Rules
		$rules = [
		    'username' => ['required', 'min:3', 'unique:users'],
		    'email' => ['required', 'email', 'unique:users'],
		    'password' => ['required', 'min:8'],
		];
		
		// Run Validation
		$validator = \Validator::make($input, $rules);
	
		// Check if validation failed
		if ($validator->fails()) {
			return $this->response->errorBadRequest($validator->errors());
		} else {
			
			// Create user object
			$user = new \User;
			
			// Set user fields
			$user->username = $input['username'];
			$user->email = $input['email'];
			$user->password = \Hash::make($input['password']);
			
			// Save user
			if($user->save()) {
				return $this->response->array(['status_code' => 200, 'message' => 'User Registered.'])->setStatusCode(200);
			} else {
				return $this->response->errorInternal();
			}
		}
	}

	public function login()
	{
		// Restrict input
		$input = \Input::only('email', 'password');
			
		// Set validation Rules
		$rules = [
		    'email' => ['required', 'email'],
		    'password' => ['required', 'min:8'],
		];
	
		// Run Validation
		$validator = \Validator::make($input, $rules);
	
		// Check if validation failed
		if ($validator->fails()) {
			return $this->response->errorBadRequest($validator->errors());
		} else {
			// Attempt to authenticate user
			if (\Auth::attempt(['email' => $input['email'], 'password' => $input['password'], 'soft_deleted' => null])) {
				// Create JWT token
				$token = \JWTAuth::fromUser(\Auth::user());
				return $this->response->array(\compact('token'));
			} else {
				return $this->response->errorForbidden('Wrong login credentials provided.');
			}
		}
	}

	public function logout()
	{
		// Blacklist JWT token
		\JWTAuth::parseToken()->invalidate();
		return $this->response->array(['status_code' => 200, 'message' => 'User logout',])->setStatusCode(200);
	}
}