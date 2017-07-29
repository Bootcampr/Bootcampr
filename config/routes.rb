Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :users

  resources :pages, only: [:index]

  resources :projects, only: [:index, :show, :new, :create]
  root to: 'pages#index'

end
