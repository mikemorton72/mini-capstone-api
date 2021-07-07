class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    # update status to "purchased" and add order_id (Order.last.id + 1)
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    carted_products = carted_products.each do |carted_product| 
      carted_product.status = "purchased"
      carted_product.order_id = Order.last.id + 1
      carted_product.save
    end
    
    # find subtotal, tax, total for all in cart
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end
    tax = subtotal * 0.09
    total = subtotal + tax


    # Create and save order
    order = Order.new(
      user_id: current_user.id,
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
