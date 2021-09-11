class IngredientSerializer < ActiveModel::Serializer
  attributes :ingredient_id, :name, :quantity, :updated_at
end
