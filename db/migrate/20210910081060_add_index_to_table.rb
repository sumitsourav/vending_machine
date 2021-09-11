class AddIndexToTable < ActiveRecord::Migration[6.1]
  def change
    add_index :ingredients, :name
  end
end