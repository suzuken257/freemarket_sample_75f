Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :create, :show]
  resources :deliver_addresses, only:[:new, :create]
end
