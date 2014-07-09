Rails.application.routes.draw do

  root:to => 'pages#index' 

  devise_for :users
  namespace :admin do 
    resources :products
  end
 
 
end