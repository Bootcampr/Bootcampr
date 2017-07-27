Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :pages, only: [:index]

  root to: 'pages#index'
end
