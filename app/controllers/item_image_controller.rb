class ItemImageController < ApplicationController
  
  

  p
  def images_params
    params.require(:item).permit(:name, :price, images_attributes: [:src])
end
