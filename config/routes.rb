Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  get 'register', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update]

  resources :applications, only: [:show, :update] do
    get 'decide', on: :member
  end

  resources :demographics, only: [:create, :update]
  resources :addresses,    only: [:create, :update]
  resources :experiences,  only: [:create, :update]
  resources :recruitments, only: [:create, :update]

  namespace :admin do
    resources :applications, only: [:show, :index, :update, :edit] do
      patch 'toggle', on: :member
    end

    resources :evaluations,  except: [:index]
  end

  root 'home#show'
end
