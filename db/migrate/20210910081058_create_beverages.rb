class CreateBeverages < ActiveRecord::Migration[6.1]
  def change
    create_table :beverages do |t|
      t.string :name
      t.integer :recipe

      t.timestamps
    end
  end
end
