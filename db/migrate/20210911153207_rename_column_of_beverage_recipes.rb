class RenameColumnOfBeverageRecipes < ActiveRecord::Migration[6.1]
  def change
    rename_column :beverage_recipes, :ingredient_ids, :ingredient_id
    add_column :beverage_recipes, :quantity, :integer
  end
end
