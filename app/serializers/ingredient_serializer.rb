class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity, :updated_at
end
