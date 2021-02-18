Rails.application.routes.draw do
  resources :events
  resources :agreements
  resources :reminders
  resources :answers
  resources :calls
  resources :screenplays
  resources :questions
  get 'questions/up/:id' => 'questions#up', as: 'up'
  get 'questions/down/:id' => 'questions#down', as: 'down'
  resources :partners
  resources :clients do
    get 'call/:call_id' => "clients#call", as: "call"
  end

  resources :users
  devise_for :users, path: 'auth', path_names: { sign_in: 'login',
                                               sign_out: 'logout',
                                               password: 'secret',
                                               confirmation: 'verification',
                                               unlock: 'unblock',
                                               registration: 'register',
                                               sign_up: 'signup' }

  get "home/index"
  get "home/minor"

  root to: 'home#index'

end
