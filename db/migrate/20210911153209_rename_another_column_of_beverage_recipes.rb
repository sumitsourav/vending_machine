class RenameAnotherColumnOfBeverageRecipes < ActiveRecord::Migration[6.1]
  def change
    change_column :beverage_recipes, :ingredient_id, :integer
  end
end
