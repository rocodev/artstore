Rails.application.routes.draw do

  root :to => "products#index"

  devise_for :users
  
  namespace :admin do
    resources :products
    resources :orders
  end

  namespace :account do 
    resources :orders
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      post :checkout
      delete :clear_cart
    end
  end

  resources :items, :controller => "cart_items"

  resources :orders do
    member do
      get :pay_with_credit_card
    end
  end


end
