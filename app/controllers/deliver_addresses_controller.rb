class DeliverAddressesController < ApplicationController
  def new
    @deliver_address=DeliverAddress.new
  end
  def create
    @deliver_address=DeliverAddress.new(deliver_address_params)
    @deliver_address.save
  end

  private 
  def deliver_address_params
    params.require(:deliver_address).permit(:zip_code, :prefecture, :city, :address1, :apartment_address, :telephone).merge(user_id: current_user.id)
  end
end
