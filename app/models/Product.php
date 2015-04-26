<?php
class Product extends Eloquent {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'products';
    
	/**
	 * ProductSwipe relationship - one to many
	 */
	public function swipes() {
		return $this->hasMany('ProductSwipe', 'product_id')->where('soft_deleted', null);
	}
	
	/**
	 * ProductImages relationship - one to many
	 */
	public function images() {
		return $this->hasMany('ProductImage', 'product_id')->where('soft_deleted', null);
	}

	/**
	 * gets products
	 * 
	 * @param  int $limit
	 * @param  int $offset 
	 * @return array of objects
	 */
	static public function get($limit = 10, $offset = 0) {
		return self::where('soft_deleted', null)->skip($offset)->take($limit)->get();
	}
	
	/**
	 * swipe product
	 * 
	 * @param  object $user
	 * @param  string $swipe
	 * @return bool
	 */
	public function swipe($user, $swipe) {
		$productSwipe = $this->swipes()->where('user_id', $user->id)->where('soft_deleted', null)->first();
		
		if(!is_object($productSwipe)) {
			$productSwipe = new ProductSwipe;
			$productSwipe->user_id = $user->id;
			$productSwipe->product_id = $this->id;
			$productSwipe->swipe = $swipe;
			$productSwipe->save();
		} else {
			if($productSwipe !== $productSwipe->swipe) {
				$productSwipe->swipe = $swipe;
				$productSwipe->save();				
			}
		}
		
		return true;
	}
	
	/**
	 * Create image for products
	 * 
	 * @param  string $url
	 * @param  int $main
	 * @return object
	 */
	public function createImage($url ='', $main = 0) {
		$productImage = new ProductImage;
		$productImage->product_id = $this->id;
		$productImage->url = $url;
		$productImage->main = $main;
		$productImage->save();
		
		return $productImage;
	}
}