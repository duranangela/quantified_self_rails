class MealSerializer < ActiveModel::Serializer

  attributes :id, :name
  belongs_to :foods

end
