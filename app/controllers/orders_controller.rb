class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    # Total cost
    product = Product.find_by(id: params[:product_id])
    if product
      subtotal = product.price * params[:quantity].to_i
      tax =  product.tax * params[:quantity].to_i
      total = subtotal + tax
    end
    # Create and save order
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total 
    )
    # Render response
    if order.save
      render json: order
    else
      render json: order.errors.full_messages
    end
  end

  def show
    order = Order.find_by(id: params[:id], user_id: current_user.id)
    if order
      render json: order
    else
      render json: {}
    end
  end

  def index
    render json: current_user.orders
  end
end
