class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @items=Item.includes(:user)
  end
  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def new
    @item = Item.new
    @item.images.new
  end
  
  @items = Item.includes(:images).order('created_at DESC')
  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:introduction,:price).merge(user_id: current_user.id)
  end
end
