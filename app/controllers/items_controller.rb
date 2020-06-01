class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show,:edit, :update, :destroy, :purchase_confirmation, :buy]

  require 'payjp'
  
  def index
    @parents = Category.where(ancestry: nil)
    @items=Item.includes(:user, :item_image).order('created_at DESC')
    @items=Item.all.order('created_at DESC')
  end

  def show
    @images=@item.item_images
    @image = @images.first
    @items = Item.find(params[:id])
    @parents = Category.all.order("id ASC").limit(1000)
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
      redirect_to root_path
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
      redirect_to root_path
    else
      render :destroy
    end
  end

  def purchase_confirmation
    @card = CreditCard.find_by(user_id: current_user.id)
    @address = DeliverAddress.find_by(user_id: current_user.id)
    # @address_info = Prefecture.find(current_user.prefecture_id).name
    @full_name = current_user.family_name + current_user.first_name
    if @card.present?
      # 登録している場合,PAY.JPからカード情報を取得する
      # PAY.JPの秘密鍵をセットする。
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # PAY.JPから顧客情報を取得する。
      customer = Payjp::Customer.retrieve(@card.payjp_id)
      # PAY.JPの顧客情報から、デフォルトで使うクレジットカードを取得する。
      @card_info = customer.cards.retrieve(customer.default_card)
      # クレジットカード情報から表示させたい情報を定義する。
      # クレジットカードの画像を表示するために、カード会社を取得
      @card_brand = @card_info.brand
      # クレジットカードの有効期限を取得
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 

      # クレジットカード会社を取得したので、カード会社の画像をviewに表示させるため、ファイルを指定する。
      case @card_brand
      when "Visa"
        @card_image = "visa.svg"
      when "JCB"
        @card_image = "jcb.svg"
      when "MasterCard"
        @card_image = "master-card.svg"
      when "American Express"
        @card_image = "american_express.svg"
      when "Diners Club"
        @card_image = "dinersclub.svg"
      when "Discover"
        @card_image = "discover.svg"
      end
    end
  end

  def buy
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
    # すでに購入されていないか？
    if @item.buyer_id.present? 
      redirect_back(fallback_location: root_path) 
      flash[:alert] = '購入済みの商品です'
    elsif @card.blank?
      # カード情報がなければ、買えないから戻す
      redirect_to action: "purchase_confirmation"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      # 購入者もいないし、クレジットカードもあるし、決済処理に移行
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # 請求を発行
      Payjp::Charge.create(
      amount: @item.price,
      customer: @card.payjp_id,
      currency: 'jpy',
      )
      # 売り切れなので、productの情報をアップデートして売り切れにします。
      if @item.update(buyer_id: current_user.id)
        flash[:notice] = '商品を購入しました。'
        redirect_to controller: 'items', action: 'index', id: @item.id
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: 'items', action: 'index', id: @item.id
      end
    end
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
    params.require(:item).permit(:name,:introduction,:item_status, :price,:shipping_area_from, :shipping_fee_burden,:estimated_shipping_date,:category_id,:ancestry, item_images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
