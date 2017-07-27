Rails.application.routes.draw do
  devise_for :users

  resources :pages, only: [:index]
  resources :users, only: [:new, :create]

  root to: 'pages#index'
end
