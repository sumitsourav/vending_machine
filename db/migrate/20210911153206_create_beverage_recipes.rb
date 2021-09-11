class CreateBeverageRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :beverage_recipes do |t|
      t.integer :beverage_recipe_id
      t.string :ingredient_ids

      t.timestamps
    end
  end
end
