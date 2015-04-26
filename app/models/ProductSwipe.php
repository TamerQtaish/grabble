<?php
class ProductSwipe extends Eloquent {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'product_swipes';    

	/**
	 * Product relationship - many to one
	 */	
	public function product() {
		return $this->belongsTo('Product', 'product_id')->where('soft_deleted', null);
	}

	/**
	 * User relationship - many to one
	 */	
	public function user() {
		return $this->belongsTo('User', 'user_id')->where('soft_deleted', null);
	}
}