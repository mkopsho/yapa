Rails.application.routes.draw do
  get '/', to: 'sessions#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#clear'
  
  get '/signup', to: 'users#new'

  resources :lists do
    resources :tasks, only: [:new, :index]
  end

  resources :tasks
  resources :labels
  resources :memberships
  resources :teams
  resources :users
end
