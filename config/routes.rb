Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  get 'register', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update]

  resources :applications, only: [:show, :update]
  resources :demographics, only: [:create, :update]
  resources :addresses,    only: [:create, :update]
  resources :experiences,  only: [:create, :update]

  root 'home#show'
end
