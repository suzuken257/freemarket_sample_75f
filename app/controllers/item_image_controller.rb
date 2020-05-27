class ItemImageController < ApplicationController
  
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end
  
  private

  def images_params
    params.require(:item).permit(:name, :price, images_attributes: [:src])
end
