Rails.application.routes.draw do
  root 'welcome#index'
  
  get 'welcome/index'
  get 'welcome/about'

  resources :users, only: [:new, :create]
  post '/users/confirm' => 'users#confirm'
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :todos
end
