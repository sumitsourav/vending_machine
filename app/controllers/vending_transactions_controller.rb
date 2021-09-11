# frozen_string_literal: true

# Internal: Controller class for Vending Machine
class VendingTransactionsController < ApplicationController
  DISPENSED = 'Dispensed'
  
  def create
    beverage_id = params[:beverage_id]
    beverage = Beverage.find_by!(id: beverage_id)
    recipe_id = beverage.recipe_id
    recipes = BeverageRecipe.where(recipe_id: recipe_id)
    hash_recipe = {}
    recipes.map do |res|
      hash_recipe[res.ingredient_id] = res.quantity
    end
    # recipe = Inventory.get_recipe(name: params[:beverage_name])
    empty_ingredients = []
    count = 0
    hash_ingredients_present = []
    error_message = []
    # recipe.instance_variables.each {|var| hash_recipe[var.to_s.delete("@")] = recipe.instance_variable_get(var) }
    ingredients = Ingredient.all
    ingredients.map do |ing|
      hash_ingredients_present.push({
        id: ing.ingredient_id,
        name: ing.name,
        quantity: ing.quantity
      })
    end
    error_msg = []
    hash_ingredients_present.each do |hip|
      current_units = hip[:quantity] - hash_recipe[hip[:id]]
      if current_units > 0
        hash_ingredients_present[count][:quantity] = current_units
      elsif current_units == 0
        empty_ingredients.push({id: hip[:id], name: hip[:name]})
        hash_ingredients_present[count][:quantity] = current_units
      else
        error_msg = error_msg.push("Unable to Make Beverage, Insufficient Ingredients: #{hip[:name]} is less than required units. Please Refill!")
      end
      count = count + 1
    end
    raise ActionController::BadRequest, error_msg if error_msg.present?

    update_ingredients(hash_ingredients_present)

    output_json = { status: DISPENSED }
    output_json[:empty_ingredients] = empty_ingredients if empty_ingredients.present?
    render json: output_json
  end

  # Private method which completes the transaction once its ok to dispense the requireved beverage
  def update_ingredients(hash)
    hash.each do |h|
      ingredient = Ingredient.find_by!(id: h[:id])
      ingredient.update!(quantity: h[:quantity])
    end
  end
end