class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_product, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren, :purchase_confirmation]

  def index
    @parents = Category.where(ancestry: nil)
    @items=Item.includes(:user, :item_image).order('created_at DESC')
  end
  
  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = []
      Category.where(ancestry: nil).each do |parent|
         @category_parent_array << parent.name
      end
  end
  
  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def purchase_confirmation
    # 商品出品機能が実装できたら下記のコメントアウトを外す
    # @item = Item.find(params[:id])
    # @items = @item.purchase_confirmation
  end

  def search
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
       #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.json
    end
 end

 # 子カテゴリーが選択された後に動くアクション
 def get_category_grandchildren
#選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
    respond_to do |format|
      format.json
    end
 end

  private
  def item_params
    params.require(:item).permit(:name,:introduction,:item_status, :price,:shipping_area_from, :shipping_fee_burden,:estimated_shipping_date,:category_parent_array, item_images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
