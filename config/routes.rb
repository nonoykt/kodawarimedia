Rails.application.routes.draw do

  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  root to: 'users#index'
  post '/signup', to: 'users#create'
  get '/signup', to: 'users#new'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
