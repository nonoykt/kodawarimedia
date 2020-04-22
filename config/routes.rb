Rails.application.routes.draw do
  
  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  root to: 'users#index'
  post '/signup', to: 'users#create'
  get '/signup', to: 'users#new'
  resources :users
end
