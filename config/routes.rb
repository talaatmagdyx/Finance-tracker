Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "user/registrations"}

  #home page
  root 'welcome#index'

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends', to: 'users#my_friends'

  get 'search_stocks', to: 'stocks#search'
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: "users#add_friend"

  resources :user_stocks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :friendships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
