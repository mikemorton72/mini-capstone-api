class ProductsController < ApplicationController
  def give_one_product
    product = Product.all[rand(0..(Product.all.length-1))]
    render json: product.as_json
  end
  
  def give_all_products
    render json: Product.all.as_json
  end
end
