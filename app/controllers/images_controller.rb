class ImagesController < ApplicationController
  def create
    image = Image.new(url: params[:url], product_id: params[:product_id])
    image.save
    render json: image
  end
  
  def index
    render json: Image.all
  end

  def show
    render json: Image.find_by(id: params[:id])
  end
end
