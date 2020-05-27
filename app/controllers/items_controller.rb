class ItemsController < ApplicationController
  def index
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

  def purchase_confirmation
    # 商品出品機能が実装できたら下記のコメントアウトを外す
    # @item = Item.find(params[:id])
    # @items = @item.purchase_confirmation
  end

  private
  def item_params
    params.require(item).permit(:name,:introduction,:shipping_area_from,:price).merge(user_id: current_user.id)
  end
end
