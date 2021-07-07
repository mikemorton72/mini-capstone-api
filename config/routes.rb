Rails.application.routes.draw do
  # Products
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  # Suppliers
  get "/suppliers" => "suppliers#index"
  get "suppliers/:id" => "suppliers#show"
  post "suppliers" => "suppliers#create"

  # Images
  get "images" => "images#index"
  get "images/:id" => "images#show"
  post "images" => "images#create"

  # Users
  post "/users" => "users#create"

  # Sessions
  post "/sessions" => "sessions#create"

  # Orders
  post "/orders" => "orders#create"
  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"

  # CartedProducts
  post "/carted_products" => "carted_products#create"
  delete "/carted_products/:id" => "carted_products#destroy"
  get "/carted_products/:id" => "carted_products#show"
  get "/carted_products" => "carted_products#index"
  
end
