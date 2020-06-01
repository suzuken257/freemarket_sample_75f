class DeliverAddressesController < ApplicationController
  def new
    @deliver_address=DeliverAddress.new
  end
  def create
    @deliver_address=DeliverAddress.new(deliver_address_params)
    if @deliver_address.save
      flash[:notice] = '配送先情報を登録しました。'
      redirect_to "/"
    else
      flash[:alert] = '登録に失敗しました。'
      redirect_to new_deliver_address_path
    end
  end

  private 
  def deliver_address_params
    params.require(:deliver_address).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:zip_code, :prefecture_id, :city, :address1, :apartment_address, :telephone).merge(user_id: current_user.id)
  end
end
