class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_product, only: [:show,:edit, :update, :destroy, :purchase_confirmation]

  def index
    @items=Item.all.order('created_at DESC')
  end

  def show
    @images=@item.item_images
    @image = @images.first
  end

  
  def new
    @item = Item.new
    @item.item_images.new
  end
  
  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to item_path(@item)
    else
      render :destroy
    end
  end

  def purchase_confirmation
    # 商品出品機能が実装できたら下記のコメントアウトを外す
    # @item = Item.find(params[:id])
    # @items = @item.purchase_confirmation
  end

  private
  def item_params
    params.require(:item).permit(:name,:introduction,:item_status, :price,:shipping_area_from, :shipping_fee_burden,:estimated_shipping_date, item_images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
