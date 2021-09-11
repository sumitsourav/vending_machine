class AddIndexToBeverages < ActiveRecord::Migration[6.1]
  def change
    add_index :beverages, :name
  end
end