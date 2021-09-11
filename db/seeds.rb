black_coffee = Beverage.create!(name: 'Black Coffee', recipe: 1)
milk_coffee = Beverage.create!(name: 'Milk Coffee', recipe: 2)
black_coffee_sugarless = Beverage.create!(name: 'Black Coffee Sugarless', recipe: 3)
milk_coffee_sugarless = Beverage.create!(name: 'Milk Coffee Sugarless', recipe: 4)

water = Ingredient.create!(name: 'water', quantity: 10)
milk = Ingredient.create!(name: 'milk', quantity: 10)
sugar = Ingredient.create!(name: 'sugar', quantity: 10)
coffee = Ingredient.create!(name: 'coffee', quantity: 10)