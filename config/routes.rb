Rails.application.routes.draw do

  root :to => "products#index"

  devise_for :users
  namespace :admin do
    resources :products
  end

end
