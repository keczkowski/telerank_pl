Rails.application.routes.draw do
  resources :events
  resources :agreements
  resources :reminders
  resources :answers
  resources :calls
  resources :screenplays
  resources :questions
  resources :partners
  resources :clients do
    get 'call/:call_id' => "clients#call", as: "call"
  end
  devise_for :users
  resources :users
  get "home/index"
  get "home/minor"
  get 'questions/up/:id' => 'questions#up', as: 'up'
  get 'questions/down/:id' => 'questions#down', as: 'down'

  root to: 'home#index'

end
