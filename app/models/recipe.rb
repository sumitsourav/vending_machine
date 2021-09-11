class Recipe
    attr_reader :water, :milk, :sugar, :coffee
  
    def initialize(water:, milk:, sugar:, coffee:)
      @water = water
      @milk = milk
      @sugar = sugar
      @coffee = coffee
    end
  end
  