class OrdersController < ApplicationController
  def create
    # Authenticate
    if current_user
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
    else
      render json: {message: "Please log in."}
    end
  end

  def show
    if current_user
      order = Order.find_by(id: params[:id])
      if order.user_id == current_user.id
        render json: order
      else
        render json: {message: "User order not found"}
      end
    else
      render json: {message: "Please log in."}
    end
  end

  def index
    if current_user
      render json: Order.where(user_id: current_user.id)
    else
      render json: {message: "Please log in."}
    end
  end
end
