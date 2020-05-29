Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only:[:index, :new, :show, :create] do
    # 商品出品機能が実装できたらcollectionをmemberに変更する
    collection do
      get :purchase_confirmation
    end
  end

  resources :items, only:[:index, :new, :show]
  resources :deliver_addresses, only:[:new, :create]
  resources :users, only: :show
  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end
end