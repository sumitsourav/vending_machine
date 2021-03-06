# frozen_string_literal: true

# Internal: Controller class for Beverages
class IngredientsController < ApplicationController

  def create
    params.require(%i[ingredient_id name quantity])
    post_params = {
      ingredient_id: params[:ingredient_id],
      name: params[:name],
      quantity: params[:quantity]
    }
    render json: Ingredient.create!(post_params), status: :created
  end

  def index
    ingredients = Ingredient.all

    render json: {
      items: ActiveModelSerializers::SerializableResource.new(ingredients),
      total_results: ingredients.count
    }
  end

  def show
    render json: current_ingredient, status: :ok
  end

  def update
    params.require(%i[id quantity])
    retrieve_and_validate_put.update!(quantity: params[:quantity])
    head :no_content
  end

  def current_ingredient
    Ingredient.find_by!(id: params[:id])
  end

  def destroy
    params.require(%i[id])
    current_ingredient.destroy!
    head :no_content
  end

  def serialize_ingredient_collection(collection)
    ActiveModelSerializers::SerializableResource.new(
      collection,
      each_serializer: IngredientSerializer,
      adapter: :attributes
    )
  end

  # Private: Validates few constraints in update action.
  def retrieve_and_validate_put
    ingre_config = Ingredient.find_by!(id: params[:id])
    error_message = 'The requested ingredient cannot be' \
              'updated for this since its the same value'
    (raise ActionController::BadRequest, error_message) unless ingre_config.quantity != params[:quantity].to_i
    ingre_config
  end
end