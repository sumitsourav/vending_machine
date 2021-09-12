
water = Ingredient.create!(ingredient_id: 1, name: 'water', quantity: 10)
milk = Ingredient.create!(ingredient_id: 2, name: 'milk', quantity: 10)
sugar = Ingredient.create!(ingredient_id: 3, name: 'sugar', quantity: 10)
coffee = Ingredient.create!(ingredient_id: 4, name: 'coffee', quantity: 10)

black_coffee = Beverage.create!(name: 'Black Coffee', recipe_id: 1)
black_coffee.beverage_recipes.create!({
    recipe_id: 1,
    ingredient_id: 1,
    quantity: 3,
    beverage_id: 1
})
black_coffee.beverage_recipes.create!({
    recipe_id: 1,
    ingredient_id: 3,
    quantity: 1,
    beverage_id: 1
})
black_coffee.beverage_recipes.create!({
    recipe_id: 1,
    ingredient_id: 4,
    quantity: 1,
    beverage_id: 1
})

milk_coffee = Beverage.create!(name: 'Milk Coffee', recipe_id: 2)
milk_coffee.beverage_recipes.create!({
    recipe_id: 2,
    ingredient_id: 1,
    quantity: 1,
    beverage_id: 2
})
milk_coffee.beverage_recipes.create!({
    recipe_id: 2,
    ingredient_id: 2,
    quantity: 2,
    beverage_id: 2
})
milk_coffee.beverage_recipes.create!({
    recipe_id: 2,
    ingredient_id: 3,
    quantity: 1,
    beverage_id: 2
})
milk_coffee.beverage_recipes.create!({
    recipe_id: 2,
    ingredient_id: 4,
    quantity: 1,
    beverage_id: 2
})

black_coffee_sugarless = Beverage.create!(name: 'Black Coffee Sugarless', recipe_id: 3)
black_coffee_sugarless.beverage_recipes.create!({
    recipe_id: 3,
    ingredient_id: 1,
    quantity: 3,
    beverage_id: 3
})
black_coffee_sugarless.beverage_recipes.create!({
    recipe_id: 3,
    ingredient_id: 4,
    quantity: 1,
    beverage_id: 3
})

milk_coffee_sugarless = Beverage.create!(name: 'Milk Coffee Sugarless', recipe_id: 4)
milk_coffee_sugarless.beverage_recipes.create!({
    recipe_id: 4,
    ingredient_id: 1,
    quantity: 1,
    beverage_id: 4
  })
milk_coffee_sugarless.beverage_recipes.create!({
    recipe_id: 4,
    ingredient_id: 2,
    quantity: 2,
    beverage_id: 4
  })
milk_coffee_sugarless.beverage_recipes.create!({
    recipe_id: 4,
    ingredient_id: 4,
    quantity: 1,
    beverage_id: 4
  })
