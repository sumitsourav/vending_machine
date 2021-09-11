# frozen_string_literal: true

# Internal: Controller class for Beverages
class BeveragesController < ApplicationController

  def create
    params.require(%i[name recipe_id])
    post_params = {
      name: params[:name],
      recipe_id: params[:recipe_id]
    }
    render json: Beverage.create!(post_params), status: :created
  end

  def index
    beverages = Beverage.all

    render json: {
      items: ActiveModelSerializers::SerializableResource.new(beverages),
      total_results: beverages.count
    }
  end

  def show
    render json: current_beverage, status: :ok
  end

  def current_beverage
    Beverage.find_by!(id: params[:id])
  end

  def destroy
    params.require(%i[id])
    current_beverage.destroy!
    head :no_content
  end

  def serialize_beverage_collection(collection)
    ActiveModelSerializers::SerializableResource.new(
      collection,
      each_serializer: BeverageSerializer,
      adapter: :attributes
    )
  end

end