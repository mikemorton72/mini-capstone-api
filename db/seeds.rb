# 5.times do
#   supplier = Supplier.new(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     phone_number: rand(111111..555555)
#   )
#   supplier.save
# end

# 100.times do
#   product = Product.new(
#     name: Faker::Commerce.product_name, 
#     price: Faker::Commerce.price.to_i, 
#     description: Faker::Marketing.buzzwords,
#     amount_in_inventory: rand(1..200),
#     supplier_id: Supplier.all.sample.id
#   )
#   product.save
#   # product = Product.last
#   # product.destroy
# end

300.times do
  image = Image.new(url: Faker::Placeholdit.image, product_id: Product.all.sample.id)
  image.save
end
