<?php

return array(
    'www.asos.com' => [
                       'title' => [
                                   ['match' => "//span[@class='product_title']",
                                   'is_array' => false,
                                   'selecter' => [
                                                  'method' => 'nodeValue',
                                                  'value' => null,
                                                  'parse' => null,
                                                  ],
                                   ],
                                  ],
                       
                       'main_image' => [
                                        ['match' => "//img[@class='main-image xl']",
                                        'is_array' => false,
                                        'selecter' => [
                                                       'method' => 'getAttribute',
                                                       'value' => 'src',
                                                       'parse' => null,
                                                       ],
                                        ],
                                       ],

                       'images' => [
                                   ['match' => "//img[@class='xl']",
                                   'is_array' => true,
                                   'selecter' => [
                                                  'method' => 'getAttribute',
                                                  'value' => 'src',
                                                  'parse' => null,
                                                  ],
                                   ],
                                  ],

                       'price' => [
                                   ['match' => "//span[@class='product_price_details discounted-price']",
                                   'is_array' => false,
                                   'selecter' => [
                                                  'method' => 'nodeValue',
                                                  'value' => null,
                                                  'parse' => 'float',
                                                  ],
                                   ],
                                   ['match' => "//span[@class='product_price_details']",
                                   'is_array' => false,
                                   'selecter' => [
                                                  'method' => 'nodeValue',
                                                  'value' => null,
                                                  'parse' => 'float',
                                                  ],
                                   ],
                                  ],

                       'sale_price' => [
                                        ['match' => "//span[@class='previousprice']",
                                        'is_array' => false,
                                        'selecter' => [
                                                       'method' => 'nodeValue',
                                                       'value' => null,
                                                       'parse' => 'float',
                                                       ],
                                        ],
                                       ]

                      ],
);
