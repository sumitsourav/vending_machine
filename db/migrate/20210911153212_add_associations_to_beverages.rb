class AddAssociationsToBeverages < ActiveRecord::Migration[6.1]
  def change
    change_table :beverage_recipes do |t|
        t.belongs_to :beverage, index: true, foreign_key: true
    end
  end
end
