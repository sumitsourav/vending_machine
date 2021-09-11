class ChangeAnotherColumnNameOfBeverageRecipes < ActiveRecord::Migration[6.1]
  def change
    rename_column :beverage_recipes, :beverage_recipe_id, :recipe_id
  end
end
