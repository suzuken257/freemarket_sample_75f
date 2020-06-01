Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    member do
      get :purchase_confirmation
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      post :buy
    end
  end

  resources :deliver_addresses, only:[:new, :create]
  resources :users, only: :show
  resources :credit_cards, only: [:new, :show, :delete] do
    collection do
      post 'pay', to: 'credit_cards#pay'
      delete 'delete'
    end
  end
end