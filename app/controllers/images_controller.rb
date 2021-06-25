class ImagesController < ApplicationController
  def create
    image = Image.create(url: params[:url], product_id: params[:product_id])
    image.save
    render json: image.as_json
  end
  
  def index
    render json: Image.all.as_json
  end

  def show
    render json: Image.find_by(id: params[:id]).as_json
  end
end
