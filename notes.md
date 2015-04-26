Notes:

- To get all the api routes use this command:
php artisan api:routes

###############################################################################################################################################
+--------+------------------------------------------+------+-----------------------------------+------------+-----------+----------+
| Domain | URI                                      | Name | Action                            | Version(s) | Protected | Scope(s) |
+--------+------------------------------------------+------+-----------------------------------+------------+-----------+----------+
|        | POST api/user/register                   |      | Api\V1\UserController@register    | v1         | No        |          |
|        | POST api/user/login                      |      | Api\V1\UserController@login       | v1         | No        |          |
|        | GET|HEAD api/user/logout                 |      | Api\V1\UserController@logout      | v1         | No        |          |
|        | GET|HEAD api/products/{limit?}/{offset?} |      | Api\V1\ProductController@products | v1         | No        |          |
|        | GET|HEAD api/product/{swipe}/{productId} |      | Api\V1\ProductController@swipe    | v1         | No        |          |
|        | GET|HEAD api/product/scrape              |      | Api\V1\ProductController@scrape   | v1         | No        |          |
+--------+------------------------------------------+------+-----------------------------------+------------+-----------+----------+
###############################################################################################################################################

- The API uses JWT authentication, you can still pass it through the url for testing; The token is returned once the user logins.

exmaples:
{your_domain}/api/product/discard/10?token={your_token}

-DataBase:
There is a mysql dump with some test data (grabble.sql) and the original queries (sql.remove.on.release)

Issues:
- The Scraper doesn't grab the currency of the price and sale price.
- Laravels Database Migrations not used.
- Not all Exceptions are being catched correctly, mostly the ones to do with missing the token.
- Built on Laravel 4 not 5, Laravel 5 breaks when installing Dingo and Tymon packages; Its the composer on this laptop acting up

