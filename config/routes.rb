Rails.application.routes.draw do
  get '/', to: 'sessions#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#clear'
  
  get '/signup', to: 'users#new'

  resources :teams do
    resources :lists, only: [:new, :index]
  end

  resources :lists do
    resources :tasks, only: [:new, :index]
  end

  resources :tasks
  resources :memberships
  resources :users
end
