<?php
namespace Api\V1;

class ProductController extends ApiBaseController {

	public function products($limit = 10, $offset = 0)
	{
		// Set input in array for validation
		$input = ['limit' => $limit,
			  'offset' => $offset,                  
			 ];

		// Set validation Rules
		$rules = [
		    'limit' => ['required', 'integer'],
		    'offset' => ['required', 'integer'],
		];
	
		// Run Validation
		$validator = \Validator::make($input, $rules);
	
		// Check if validation failed
		if ($validator->fails()) {
			return $this->response->errorBadRequest($validator->errors());
		} else {
			// Get product within limit and offest
			$products = \Product::get($limit, $offset);
			return $this->response->array($products->toArray())->setStatusCode(200);
		}
	}
	
	public function swipe($swipe, $productId)
	{
		// Set input in array for validation
		$input = [
				'productId' => $productId,
				'swipe' => $swipe,
			];
			
		// Set validation Rules
		$rules = [
		    'productId' => ['required', 'integer'],
		    'swipe' => ['required', 'in:grab,discard'],
		];
	
		// Run Validation
		$validator = \Validator::make($input, $rules);
	
		// Check if validation failed
		if ($validator->fails()) {
			return $this->response->errorBadRequest($validator->errors());
		} else {
			// Get product object using provided id
			$product = \Product::where('id', $productId)->where('soft_deleted', null)->first();

			// Check if product object was found
			if(is_object($product)) {
				// Get user object
				$user = \JWTAuth::parseToken()->authenticate();
				
				// Implement swipe action on product
				$product->swipe($user, $swipe);
				return $this->response->array(['status_code' => 200, 'message' => 'Product Swiped.'])->setStatusCode(200);
			} else {
				return $this->response->errorNotFound();				
			}
		}
	}
	
	public function scrape()
	{
		// Restrict input
		$input = \Input::only('url');

		// Set validation Rules
		$rules = [
		    'url' => ['required', 'url'],
		];
	
		// Run Validation
		$validator = \Validator::make($input, $rules);
	
		// Check if validation failed
		if ($validator->fails()) {
			return $this->response->errorBadRequest($validator->errors());
		} else {
			try {
				// Create Scraper object from url
				$scraper = new \Scraper($input['url']);

				// Create new product Object
				$product = new \Product;
				
				// Check and set value of title in product
				if(isset($scraper->macthes['title'])) {
					$product->title = $scraper->macthes['title'];
				}

				// Check and set value of price in product
				if(isset($scraper->macthes['price'])) {
					$product->price = $scraper->macthes['price'];
				}
				
				// Check and set value of sale_price in product
				if(isset($scraper->macthes['sale_price'])) {
					$product->sale_price = $scraper->macthes['sale_price'];
				}
				
				// Save
				$product->save();

				// Check and set main_image
				if(isset($scraper->macthes['main_image'])) {
					$product->createImage($scraper->macthes['main_image'], 1);
				}
	
				// Check and set images
				if(is_array($scraper->macthes['images'])) {
					foreach($scraper->macthes['images'] AS $image) {
						$product->createImage($image, 0);						
					}
				}
				
				return $this->response->array(['status_code' => 200, 'object' => ['product' => $product->toArray(), 'images' => $product->images()->get()->toArray()]])->setStatusCode(200);
			} catch (Exception $e) {
				return $this->response->errorInternal();
			}
		}
	}
}