Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    # 商品出品機能が実装できたらcollectionをmemberに変更する
    collection do
      get :purchase_confirmation
    end
  end

  resources :deliver_addresses, only:[:new, :create]
end
