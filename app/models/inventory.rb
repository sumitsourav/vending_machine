# frozen_string_literal: true

# Internal: The class for creating the data access object on ingredient table in the database.
require 'pry'
require 'recipe'
class Inventory
  attr_reader :recipes
  class << self
    RECIPE_LIST = [
        {
          :recipe => Recipe.new(water: 3, coffee: 1, sugar: 1, milk: 0),
          :name => "BCS"
        },
        {
          :recipe => Recipe.new(water: 1, coffee: 1, sugar: 1, milk: 2),
          :name => "MCS"
        },
        {
          :recipe => Recipe.new(water: 3, coffee: 1, sugar: 0, milk: 0),
          :name => "BCSL"
        },
        {
          :recipe => Recipe.new(water: 3, coffee: 1, milk: 2, sugar: 0),
          :name => "MCSL"
        }
    ]

    def get_recipe(name:)
      recipe = RECIPE_LIST.find { |item| item[:name] == name }[:recipe]
    end
  end
end
