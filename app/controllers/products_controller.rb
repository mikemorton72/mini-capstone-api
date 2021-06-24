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
      description: params[:description],
      amount_in_inventory: params[:amount_in_inventory])
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages},status: :unprocessable_entity
    end
  end

  def update
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.image_url = params[:image_url] || product.image_url
    product.description = params[:description] || product.description
    product.amount_in_inventory = params[:amount_in_inventory] || product.description
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    render json: product
    product.destroy
  end

end
