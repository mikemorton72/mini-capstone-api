5.times do
  supplier = Supplier.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone_number: rand(111111..555555)
  )
  supplier.save
end

100.times do
  product = Product.new(
    name: Faker::Commerce.product_name, 
    price: Faker::Commerce.price.to_i, 
    image_url: Faker::Placeholdit.image, 
    description: Faker::Marketing.buzzwords,
    amount_in_inventory: rand(1..200),
    supplier_id: Supplier.all.sample.id
  )
  product.save
  # product = Product.last
  # product.destroy
end



# create_table "products", force: :cascade do |t|
#   t.string "name"
#   t.decimal "price", precision: 12, scale: 2
#   t.string "image_url"
#   t.text "description"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.integer "amount_in_inventory"
#   t.integer "supplier_id"
# end

# create_table "suppliers", force: :cascade do |t|
#   t.string "name"
#   t.string "email"
#   t.string "phone_number"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
# end