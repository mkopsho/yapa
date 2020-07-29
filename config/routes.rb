Rails.application.routes.draw do
  get '/', to: 'sessions#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#clear'
  
  get '/signup', to: 'users#new'

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :teams do
    resources :lists, only: [:new, :index]
    resources :memberships, only: [:new]
  end

  resources :lists do
    resources :tasks, only: [:new, :index]
  end

  resources :tasks
  resources :users
  resources :memberships
end
