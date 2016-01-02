Rails.application.routes.draw do
  get 'password_resets/new'

  root 'welcome#index'
  
  get 'welcome/index'
  get 'welcome/about'

  resources :users, only: [:new, :create]
  post '/users/confirm' => 'users#confirm'
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :todos
  resources :password_resets
end
