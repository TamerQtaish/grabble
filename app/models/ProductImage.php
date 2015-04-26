<?php
class ProductImage extends Eloquent {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'product_images';    

	/**
	 * Product relationship - many to one
	 */	
	public function product() {
		return $this->belongsTo('Product', 'product_id')->where('soft_deleted', null);
	}
}