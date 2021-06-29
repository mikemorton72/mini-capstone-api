class ProductsController < ApplicationController
  def index
    if current_user
      products = Product.all
      render json: products
    else
      render json: {message: "Please log in."}
    end
  end

  def show
    if current_user
      product_id = params[:id]
      product = Product.find_by(id: product_id)
      render json: product
    else
      render json: {message: "Please log in."}
    end
  end
  
  def create
    if current_user
      product = Product.new(
        name: params[:name], 
        price: params[:price],
        description: params[:description],
        amount_in_inventory: params[:amount_in_inventory],
        supplier_id: params[:supplier_id])
      if product.save
        image = Image.new(url: params[:image_url], product_id: product.id)
        image.save
        render json: product
      else
        render json: {errors: product.errors.full_messages},status: :unprocessable_entity
      end
    else
      render json: {message: "Please log in."}
    end
  end

  def update
    if current_user
      product_id = params[:id]
      product = Product.find_by(id: product_id)
      product.name = params[:name] || product.name
      product.price = params[:price] || product.price
      product.description = params[:description] || product.description
      product.amount_in_inventory = params[:amount_in_inventory] || product.amount_in_inventory
      product.supplier_id = params[:supplier_id] || product.supplier_id
      if product.save
        render json: product
      else
        render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "Please log in."}
    end
  end

  def destroy
    if current_user
      product_id = params[:id]
      product = Product.find_by(id: product_id)
      render json: product
      product.destroy
    else
      render json: {message: "Please log in."}
    end
  end

end
