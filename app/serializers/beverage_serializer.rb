class BeverageSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipe_id
end
