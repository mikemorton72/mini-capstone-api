class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "carted"
    )
    if carted_product.save
      render json: carted_product
    else
      render json: carted_product.errors.full_messages
    end
  end
  
  def destroy
    carted_product = CartedProduct.find_by(id: params[:id], user_id: current_user.id)
    if carted_product
      carted_product.status = "removed"
      carted_product.save
      render json: carted_product
    end
  end

  def show
    carted_product = CartedProduct.find_by(id: params[:id], user_id: current_user.id)
    if carted_product
      render json: carted_product
    else
      render json: {message: "cart item not found"}
    end
  end

  def index
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render json: carted_products
  end

end
