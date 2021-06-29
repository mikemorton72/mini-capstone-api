class OrdersController < ApplicationController
  def create
    # Authenticate
    if current_user
      # Total cost
      product = Product.find_by(id: params[:product_id])
      if product
        subtotal = product.price * params[:quantity].to_i
        tax =  subtotal * 0.09 # Assuming tax rate of 9%
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
      render json: {}
    end
  end

  def show
    render json: Order.find_by(id: params[:id])
  end

  def index
    render json: Order.all
  end
end
