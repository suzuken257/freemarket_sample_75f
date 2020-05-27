class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items=Item.includes(:user)
  end
  
  def new
    @item = Item.new
    # @item.images.new
  end

  
  def create
  end

  private
  def item_params
    params.require(:item).permit(:name,:introduction,:price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
