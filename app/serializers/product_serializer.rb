class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :images, :supplier
end
