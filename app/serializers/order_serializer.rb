class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user, :subtotal, :tax, :total
end
