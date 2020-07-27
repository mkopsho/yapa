Rails.application.routes.draw do
  get '/', to: 'sessions#home'
  resources :tasks
  resources :lists
  resources :groups
  resources :teams
  resources :users
end
