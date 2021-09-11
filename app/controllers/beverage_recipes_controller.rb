# frozen_string_literal: true

# Internal: Controller class for Beverages Recipes
class BeverageRecipesController < ApplicationController
  
  def create
    params.require(%i[recipe_id ingredient_id quantity beverage_id])
    beverage = Beverage.find_by!(id: params[:beverage_id])
    post_params = {
        recipe_id: params[:recipe_id],
        ingredient_id: params[:ingredient_id],
        quantity: params[:quantity] || 0,
        beverage: beverage
      }
    render json: BeverageRecipe.create!(post_params), status: :created
  end

  def index
    beverage_recipes = BeverageRecipe.all

    render json: {
      items: ActiveModelSerializers::SerializableResource.new(beverage_recipes)
    }
  end
end