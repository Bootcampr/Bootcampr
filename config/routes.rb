Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: "registrations" }

  resources :pages, only: [:index]

  resources :users

  resources :events do
    resources :projects, only: [:new, :create]
  end

  resources :projects do
    resources :events, only: [:new, :create]
  end

  resources :tags, only: [:index, :show]

  root to: 'pages#index'

end
