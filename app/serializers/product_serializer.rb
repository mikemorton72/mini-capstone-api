class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :tax, :total, :description, :is_discounted?, :amount_in_inventory, :supplier, :image_url
end
