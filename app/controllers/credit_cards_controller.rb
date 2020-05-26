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
end
