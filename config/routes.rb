Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only:[:index, :new, :show]
  #   resources :item_image, only:[:index]
  # end
  resources :deliver_addresses, only:[:new, :create]
  resources :users, only: :show
  resources :credit_cards, only: [:new, :create, :edit, :update]
end
