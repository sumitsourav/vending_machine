# frozen_string_literal: true

# Internal: Controller class for Vending Machine
class VendingTransactionsController < ApplicationController
#   skip_before_action :verify_authenticity_token
  DISPENSED = 'Dispensed'
  
  def create
    recipe = Inventory.get_recipe(name: params[:beverage_name])
    empty_ingredients = []
    hash = {}
    count = 0
    hash_recipe = {}
    hash_ingredients_present = []
    error_message = []
    recipe.instance_variables.each {|var| hash_recipe[var.to_s.delete("@")] = recipe.instance_variable_get(var) }
    ingredients = Ingredient.all
    ingredients.map do |ing|
      hash_ingredients_present.push({
        id: ing.id,
        name: ing.name,
        quantity: ing.quantity
      })
    end
    error_msg = []
    hash_ingredients_present.each do |hip|
      current_units = hip[:quantity] - hash_recipe[hip[:name].downcase]
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