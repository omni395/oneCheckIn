Rails.application.routes.draw do
  resources :aircrafts
  root to: 'dashboard#index'

  # Users routes
  devise_for :users
  match '/users/:id', :to => 'dashboard#user', :as => :user, :via => :get # Show page for current_user

  resources :articles, only: [:index, :show]
  resources :aircrafts, only: [:index, :show]

  # Admin routes
  namespace :admin do
    root to: 'dashboard#index'
    resources :users

    resources :articles
    resources :aircrafts
  end
end
