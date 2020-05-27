class ItemImageController < ApplicationController
  
  def index
    # @items = Item.includes(:images).order('created_at DESC')
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(images_attributes: [:src])
  end
end
