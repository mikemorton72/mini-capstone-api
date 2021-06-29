class SuppliersController < ApplicationController
  def create
    supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number])
    supplier.save
    render json: supplier
  end
  def index
    render json: Supplier.all
  end

  def show
    render json: Supplier.find_by(id: params[:id])
  end
end
