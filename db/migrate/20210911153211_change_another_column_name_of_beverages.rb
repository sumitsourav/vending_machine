class ChangeAnotherColumnNameOfBeverages < ActiveRecord::Migration[6.1]
  def change
    rename_column :beverages, :beverage_recipe_id, :recipe_id
  end
end
