class ItemsController < ApplicationController
  def index
  end

  def new
    @item=Item.new
  end
  def create
    @item=Item.new(item_params)
    @item.save
    redirect_to root_path
  end
  private
  def item_params
    params.require(item).permit(:name,:introduction,:shipping_area_from,:price).merge(user_id: current_user.id)
  end
end
