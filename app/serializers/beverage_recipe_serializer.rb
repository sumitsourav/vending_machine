class BeverageRecipeSerializer < ActiveModel::Serializer
  attributes :recipe_id, :quantity, :ingredient_id
end
