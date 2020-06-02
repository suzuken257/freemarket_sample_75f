class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @parents = Category.where(ancestry: nil)
  end
end
