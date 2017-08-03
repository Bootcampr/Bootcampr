Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: "registrations" }

  resources :events do
    resources :projects, only: [:new, :create]
    resources :attendances, only: [:create, :show]
  end


  resources :projects do
    resources :events, only: [:new, :create]
    resources :collaborations, only: [:create, :show]
  end


  resources :pages, only: [:index]

  resources :users

  get 'users/:id/subscribe', to: 'users#subscriptions', as: :subscribe
  get 'users/:id/unsubscribe', to: 'users#subscriptions', as: :unsubscribe
  get '/news', to: 'pages#news', as: :news
  resources :tags, only: [:index, :show]

  root to: 'pages#index'

end
