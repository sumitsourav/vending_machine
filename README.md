# README

This README would normally document whatever steps are necessary to get the
application up and running.

This Project with the idea in mind that the User/Admin would be able to populate the beverages and ingredient with the help of the seed.rb file (Please uncomment the code form the seed file before running it). The seed file has the beverages and ingredients as per the vending machine requirements. Also the Assumption is taken that the APIS are only automating the vending process.And the recipe for the beverages are in the recipe.rb class.

- Ruby version
  Requires ruby-2.7.2
- System dependencies
  Ruby Installed
  Bundler Gem Installed

- Configuration

  Run `bundle install` to install the required packages
  Run the Following Commands to setup the DB:
  `rake db:create` - To Create the database
  `rake db:migrate` - To migrate the schema and related details
  Run `rails s` to start the server then Navigate to localhost:3000 to check if server is running

- How to run the test suite

The Project uses RSpec for testing. To execute Rspec run:

`bundle exec rspec`

- These the few assumption that has been made for the beverage vending machine are:
1. The Beverages which comes with the vending machine are name in short form for dispensing, They are:
* Black Coffee with sugar -> BCS
* Milk Coffee with sugar -> MCS
* Black Coffee sugarless -> BCSL
* Milk Coffee sugarless -> MCSL

* For seeding the DB add these lines of code to your seed.rb file and then run `rake db:seed`
* you can change the quantity of the ingredients to what ever you want (should be greater than 0).

black_coffee = Beverage.create!(name: 'Black Coffee', recipe: 1)
milk_coffee = Beverage.create!(name: 'Milk Coffee', recipe: 2)
black_coffee_sugarless = Beverage.create!(name: 'Black Coffee Sugarless', recipe: 3)
milk_coffee_sugarless = Beverage.create!(name: 'Milk Coffee Sugarless', recipe: 4)

water = Ingredient.create!(name: 'water', quantity: 10)
milk = Ingredient.create!(name: 'milk', quantity: 10)
sugar = Ingredient.create!(name: 'sugar', quantity: 10)
coffee = Ingredient.create!(name: 'coffee', quantity: 10)

- There are no endpoint to add beverages a seed.rb files is provided with the initial beverages to seed the database.

- Guide for Endpoints

* /v1/beverages - GET Endpoint to get the List of All the Beverages
* /v1/beverages/{beverageId} - GET To get the details about that particular beverage

* /v1/ingredients - GET Endpoint to get the list of all ingredients
* /v1/ingredients/{ingredientId} - GET Endpoint to get the details of a specific ingredient
* /v1/ingredients/{ingredientId} - PUT Endpoint to Refill the Inventory
* The PUT call to refill the invertory take quantity in body as { "quantity": your_quantity } or can be sent in query params as "http://localhost:3000/v1/ingredients/{ingredientId}?quantity=your_quantity"

* /v1/vend - POST by beverage name Dispenses a beverage associated with the provided beverage_name.
* For example the URL to dispense Black coffee with sugar will be "http://localhost:3000/v1/vend?beverage_name=BCS" 


