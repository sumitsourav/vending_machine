# frozen_string_literal: true

# Internal: Controller class for Beverages
class BeveragesController < ApplicationController

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

  def serialize_beverage_collection(collection)
    ActiveModelSerializers::SerializableResource.new(
      collection,
      each_serializer: BeverageSerializer,
      adapter: :attributes
    )
  end

end