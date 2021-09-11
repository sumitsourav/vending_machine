class ChangeColumnTypeOfBeverages < ActiveRecord::Migration[6.1]
  def change
    change_column :beverages, :beverage_recipe_id, :integer
  end
end