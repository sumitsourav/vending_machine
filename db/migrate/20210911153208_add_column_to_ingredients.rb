class AddColumnToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :ingredient_id, :integer
  end
end
