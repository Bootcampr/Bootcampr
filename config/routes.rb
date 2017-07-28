Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :pages, only: [:index]
  resources :users, only: [:edit, :show]

  root to: 'pages#index'
end
