Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    member do
      get :purchase_confirmation
    end
  end

  resources :deliver_addresses, only:[:new, :create]
end
