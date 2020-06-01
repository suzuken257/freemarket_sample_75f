class CreditCardsController < ApplicationController

  require "payjp"
  before_action :set_card

  def new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_path(current_user.id) if current_user.credit_card.exists?
  end

  def pay
    # PAY.JPの秘密鍵をセット（環境変数）
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]

    # jsで作成したpayjpTokenがちゃんと入っているか？
    if params['payjpToken'].blank?
      # トークンが空なら戻す
      render "new"
    else
      # トークンがちゃんとあれば進めて、PAY.JPに登録されるユーザーを作成します。
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjpToken'],
        metadata: {user_id: current_user.id}
      )

      # PAY.JPのユーザーが作成できたので、creditcardモデルを登録します。
      @card = CreditCard.new(user_id: current_user.id, payjp_id: customer.id)
      if @card.save
        redirect_to credit_card_path(current_user.id), notice:"支払い情報の登録が完了しました"
      else
        render 'new'
      end
    end
  end
  
  def delete #PayjpとCardデータベースを削除します
    card = CreditCard.find_by(user_id: current_user.id)
    if card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.payjp_id)
      customer.delete
      card.delete
      flash[:notice] = 'クレジットカード情報を削除しました。'
    end
      redirect_to action: "new"
  end

  def show
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

  private
  def set_card
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end
  
end