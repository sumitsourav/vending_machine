# README

This README would normally document whatever steps are necessary to get the
application up and running.

This Project with the idea in mind that the User/Admin would be able to populate any number of beverages along with its required recipe (recipe will be added with the help of beverage_recipe endpoint) as future proof. Also if the beverage is deleted the specific recipe associated with that beverage will also gets deleted.

- Ruby version
  Requires ruby-2.7.2
- System dependencies
  Ruby Installed
  Bundler Gem Installed

#### Configuration
 * Clone the Repo with git clone command and link - `git clone https://github.com/sumitsourav/vending_machine.git`
 * Checkout to the future_scope branch with this command - `git checkout future_scope`
 * Run `bundle install` to install the required packages
 * Run the Following Commands to setup the DB:
 * `rake db:create` - To Create the database
 * `rake db:migrate` - To migrate the schema and related details
 * Run `rails s` to start the server then Navigate to localhost:3000 to check if server is running

- How to run the test suite

The Project uses RSpec for testing. To execute Rspec run:

`bundle exec rspec`

- Guide for Endpoints

* /v1/beverages - GET Endpoint to get the List of All the Beverages
* /v1/beverages - POST endpoint to create a new beverage
* post body required for creating beverage is: 
  **`{
    name: "beverage name",
    recipe_id: recipe_id
  }`**
* /v1/beverages/{beverageId} - GET Endpoint To get the details about that particular beverage
* /v1/beverages/{beverageId} - DELETE To Delete a Beverage

-------------------------------------------------------------------------------------------------------------------------------

* /v1/ingredients - GET Endpoint to get the list of all ingredients
* /v1/ingredients - POST Endpoint to add/create new ingredient
* post body required for creatinf/adding a new ingredient is:
  **`{
    ingredient_id: "id of the ingredient",
    name: "name of the indredient",
    quantity: "quantity of the ingredient for inventory"
   }`**
* /v1/ingredients/{ingredientId} - GET Endpoint to get the details of a specific ingredient
* /v1/ingredients/{ingredientId} - PUT Endpoint to Refill the Inventory
* put body required for updating the inventory is:
 **`{
    "quantity": your_quantity
  }`**
- The PUT call to refill the invertory take quantity in body as { "quantity": your_quantity } or can be sent in query params as "http://localhost:3000/v1/ingredients/{ingredientId}?quantity=your_quantity"

-----------------------------------------------------------------------------------------------------------------------------------

* /v1/beverage_recipes - GET Endpoint to get the recipe of all the beverages
* /v1/beverage_recipes - POST Endpoint to create a new recipe for a beverage
* The recipe for the beverage can be created by posting the ingredients of the recipe one by one.
* The body required for each call is:
 **`{
   "recipe_id": recipe id of the beverage
   "ingredient_id": ingredient_id,
   "quantity": quantityof the ingredient,
   "beverage_id": id of the bevearge for which the recipe is being made
 }`**
* ***For example to add the recipe of black coffee with sugar beverage which contain 3 units of water, 1 unit of coffee, 1 unit of sugar
  three post call to the post endpoint of beverage_recipes is made with respective post bodies (assuming the water had ingredient_id = 1, coffee had ingredient_id =   2 and sugar had ingredient_id = 3).recipe_id and beverage_id remains same for all the three calls.***

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

* /v1/vend - POST Endpoint by beverage id Dispenses a beverage associated with the provided beverage_id.
* **For example the URL to dispense Black coffee with sugar can be (if beverage id of black coffee with sugar is 1): "http://localhost:3000/v1/vend?beverage_id= id   of the beverage (like 1)" or can be passed in the body of the request as `{ "beverage_id": id of the beverage }`**
