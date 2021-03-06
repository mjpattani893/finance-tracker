Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :user_stocks, except: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  get 'my_friends', to: 'users#my_friends'

  resources :users, only: [:show]
  resources :friendships

  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
end
