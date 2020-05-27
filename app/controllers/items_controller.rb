class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items=Item.includes(:user, :item_image).order('created_at DESC')
  end
  
  def new
    @item = Item.new
    @item.item_images.new
  end

  
  def create
    @item=ItemImage.new(item_image_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private
  def item_image_params
    params.require(:item).permit(:name,:introduction,:price, item_images_attributes: [:src]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
