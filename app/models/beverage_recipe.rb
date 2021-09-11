class BeverageRecipe < ApplicationRecord
  belongs_to :beverage

  validates :quantity,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              message: 'does not have a valid value. Value should be a number more'\
              ' than or equal to zero and not a decimal.'
            }
  
  validates :ingredient_id, :uniqueness => { :scope  => [:recipe_id, :ingredient_id] }
end
