Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Sessions
  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  # Users
  get 'register', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update]

  # Applications
  resources :applications, only: [:show, :update]

  # Demographics
  resources :demographics, only: [:create, :update]

  # Home
  root 'home#show'
end
