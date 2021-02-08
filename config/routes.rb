Rails.application.routes.draw do

  resources :screenplays
  resources :partners
  resources :clients
  devise_for :users
  get "home/index"
  get "home/minor"

  root to: 'home#index'

end
