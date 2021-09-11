class RenameColumnOfBeverages < ActiveRecord::Migration[6.1]
  def change
    rename_column :beverages, :recipe, :beverage_recipe_id
    change_column :beverages, :beverage_recipe_id, :string
  end
end