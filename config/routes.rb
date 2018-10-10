Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'terms',    to: 'home#terms'
  get 'privacy',  to: 'home#privacy'
  get 'warranty', to: 'home#warranty'

  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  # get 'register', to: 'users#new'
  get 'register', to: redirect('https://cerouno.typeform.com/to/VDquyl')
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
      get   'export', on: :collection
    end

    resources :evaluations, except: [:index]
  end

  scope :programs do
    get 'apprenticeship', to: 'programs#apprenticeship'
    get 'professional',   to: 'programs#professional'
    get 'mastery',        to: 'programs#mastery'

    scope :mastery do
        get 'escalabilidad-en-net',  to: 'programs#escalabilidad_en_net'
        get 'escalabilidad-en-java', to: 'programs#escalabilidad_en_java'
        get 'ciencia-de-datos',      to: 'programs#ciencia-de-datos'
    end
  end

  root 'home#show'
end
