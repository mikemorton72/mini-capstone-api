class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products
  end

  def show
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    render json: product
  end
  
  def create
    product = Product.new(
      name: params[:name], 
      price: params[:price], 
      image_url: params[:image_url], 
      description: params[:description]
    )
    product.save
    render json: product
  end

  def update
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product && product.update(
    name: params[:name] || product.name, 
    price: params[:price] || product.price, 
    image_url: params[:image_url] || product.image_url, 
    description: params[:description] || product.description
  )
    # product.save # not needed when update method is used.
    render json: product
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    render json: product
    product.destroy
  end

end
