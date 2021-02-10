Rails.application.routes.draw do
  resources :screenplays
  resources :questions
  resources :partners
  resources :clients
  devise_for :users
  get "home/index"
  get "home/minor"
  get 'questions/up/:id' => 'questions#up', as: 'up'
  get 'questions/down/:id' => 'questions#down', as: 'down'

  root to: 'home#index'

end
