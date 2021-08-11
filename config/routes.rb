Rails.application.routes.draw do

  # api_login
  match "/api_login" => "api_actions#login", :via => :post, :as => :bot_login
  match "/api_add_lead" => "api_actions#add_lead", :via => :post, :as => :bot_movies

  resources :events
  resources :agreements
  resources :reminders
  resources :answers
  resources :calls
  resources :screenplays
  resources :questions
  resources :leads
  get 'sales' => 'leads#sales', as: 'sales'
  get 'financial' => 'leads#financial', as: 'financial'
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

  root to: 'home#index'

end
