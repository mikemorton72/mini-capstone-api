Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/random_product" => "products#give_one_product"
  get "/all_products" => "products#give_all_products"
end
