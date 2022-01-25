Rails.application.routes.draw do
  root to: 'dashboard#index'

  # Users routes
  devise_for :users
  match '/users/:id', :to => 'dashboard#user', :as => :user, :via => :get # Show page for current_user

  # Admin routes
  namespace :admin do
    root to: 'dashboard#index'

    resources :users
    resources :roles
  end
end
