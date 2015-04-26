<?php
/**
 * Scraper:
 * Retrieve certain information from a given URL,
 * /app/config/scraper.php holds the configuration for this class
 * 
 * 
 * @author     Tamer Qtaish
 */
class Scraper {

	/**
	 * Array of matches found scraping the url
	 *
	 * @var array
	 */
	public $macthes = [];

	/**
	 * 
	 * Class constructor
	 *
	 * @param string $url  The targeted url to be scraped
	 */
        public function __construct($url) {
		// Parse given your to find domain
		$sourceUrl = parse_url($url);
		
		// Get config from domain
		$scraperConfig = Config::get('scraper.'.$sourceUrl['host']);
		
		// check if domain is supporter
		if(!is_array($scraperConfig)) {
			throw new Exception('Scraper: Domain not supported.');
		}

		// Grab html
		$html = self::grabHtml($url);
		
		// create DOMDocument Object
		$domDocument = new DOMDocument();
		
		// Pass html
		@$domDocument->loadHtml($html);
		
		// Create DomXpath object from DomDocument
		$domXpath = new DOMXPath($domDocument);
		
		/**
		 * This block of logic loops through the structure in the config file (config/scraper.php) 
		 * and builds the array of matches depending on the structure provided
		 */
		foreach($scraperConfig AS $key => $query) {
			foreach($query AS $subQuery) {
				$found = false;
				$xpathObjectMatch = $domXpath->query($subQuery['match']);
				
				if($subQuery['is_array']) {
					foreach($xpathObjectMatch as $object) {
						if(is_object($object) && strlen(Scraper::nodeSelect($object, $subQuery['selecter']))) {
							$this->macthes[$key][] = self::nodeSelect($object, $subQuery['selecter']);
							$found = true;
						}
					}
				} else {
					if(is_object($xpathObjectMatch->item(0)) && strlen(Scraper::nodeSelect($xpathObjectMatch->item(0), $subQuery['selecter']))) {
						$this->macthes[$key] = self::nodeSelect($xpathObjectMatch->item(0), $subQuery['selecter']);
						$found = true;
					}				
				}
				if($found) {
					break;
				}
			}	
		}
	}

	/**
	 * 
	 * grabHtml
	 *
	 * @param string $url url passed by constructor to retrieve the html
	 * @return string the html returned from given url
	 */
	private static function grabHtml($url) {
		
		// Initialize a cURL
		$curl = curl_init($url);

		// Set up cURL
		curl_setopt($curl, CURLOPT_HEADER, false);
		curl_setopt($curl, CURLOPT_FAILONERROR, true);
		curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
		curl_setopt($curl, CURLOPT_AUTOREFERER, true);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_USERAGENT, "Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; Media Center PC 4.0; SLCC1; .NET CLR 3.0.04320)");
		curl_setopt($curl, CURLOPT_TIMEOUT, 10);
		
		// Grab the data.
		$html = curl_exec($curl);
		
		// Check if we retrieve any content
		if (empty($html)) {
			throw new Exception('Scraper: No content found.');
		}
		
		// Close connection.
		curl_close($curl);
		
		// Return content
		return $html;
	}
	
	/**
	 * 
	 * nodeSelect
	 *
	 * @param object $xpathObject XpathObject to be selected
	 * @param array $selecter array of selecters to select and parse the value
	 * @return string of filtered value
	 */
	private static function nodeSelect($xpathObject, $selecter) {
		switch($selecter['method']) {
			case 'nodeValue':
				return self::parseValue($xpathObject->nodeValue, $selecter['parse']);
			break;
			case 'getAttribute':
				return self::parseValue($xpathObject->getAttribute($selecter['value']), $selecter['parse']);				
			break;
		}
	}
	
	/**
	 * 
	 * parseValue
	 *
	 * @param string $value the value to be parsed
	 * @param string $method the method to be used on the value
	 * @return string of parsed value
	 */
	private static function parseValue($value, $method) {
		switch($method) {
			case 'float':
				return preg_replace("/[^0-9,.]/", "", $value);
			break;
			default:
				return $value;
		}
	}
}