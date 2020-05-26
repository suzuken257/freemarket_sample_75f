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
    @item=Item.new
  end
  
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
    params.require(item).permit(:name,:introduction,:shipping_area_from,:price).merge(user_id: current_user.id)
  end

  def show
  end

end
