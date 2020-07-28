Rails.application.routes.draw do
  get '/', to: 'sessions#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  delete '/logout', to: 'sessions#clear'

  resources :lists do
    resources :tasks, only: [:new, :index]
  end
  
  resources :tasks
  resources :labels
  resources :groups
  resources :teams
  resources :users
end
