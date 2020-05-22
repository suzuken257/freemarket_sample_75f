Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :deliver_addresses, only:[:new, :create]
end
