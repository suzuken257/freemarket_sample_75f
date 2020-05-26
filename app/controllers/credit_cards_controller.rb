class CreditCardsController < ApplicationController
  def new
    @card=CreditCard.new
  end
  def create
    @card=CreditCard.new(credit_params)
    if @card.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  def edit
    
  end
  def update
    
  end
  private
  def credit_params
    params.require(:card).permit(:card_number,:expiration_year,:expiration_month,:security_code).marge(user_id: current_user.id )
  end
end
