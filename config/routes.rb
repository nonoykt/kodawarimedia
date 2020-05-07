Rails.application.routes.draw do
  root to: 'pages#home'
  get '/', to: 'pages#home'
  get '/help', to: 'pages#help'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  post 'likes/:micropost_id/create', to: 'likes#create', constraints: { micropost_id: /\d+/ }, as: :likes_create
  post 'likes/:micropost_id/destroy', to: 'likes#destroy', constraints: { micropost_id: /\d+/ }, as: :likes_destroy
end
