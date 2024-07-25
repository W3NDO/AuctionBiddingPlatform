Rails.application.routes.draw do
  devise_for :users
  get 'auction_item/new'
  get 'auction_item/index'
  get 'bid/new'
  get 'bid/index'
  get 'user/new'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
