Rails.application.routes.draw do
  # Products
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  #Suppliers
  get "/suppliers" => "suppliers#index"
  get "suppliers/:id" => "suppliers#show"
  post "suppliers" => "suppliers#create"

  #Images
  get "images" => "images#index"
  get "images/:id" => "images#show"
  post "images" => "images#create"

end
