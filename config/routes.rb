Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  root to: 'users#index'
  get '/signup', to: 'users#new'
  resources :users
end
