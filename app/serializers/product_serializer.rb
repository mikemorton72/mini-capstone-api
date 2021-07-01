class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :images, :supplier, :categories
end
