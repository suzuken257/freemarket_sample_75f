Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only:[:index, :show]
  resources :deliver_addresses, only:[:new, :create]
end
