Rails.application.routes.draw do
  get 'password_resets/new'

  #root 'welcome#index'
  
  root 'welcome#welcomeindex'
  get 'welcome/index'
  get 'welcome/about'

  resources :users, only: [:new, :create, :show, :index] do
    resources :todos do
      patch "complete"
    end
  end
  post '/users/confirm' => 'users#confirm'
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :password_resets
end
