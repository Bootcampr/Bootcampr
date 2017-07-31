Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: "registrations" }

  resources :events do
    resources :projects, except: [:show]
    resources :attendances, only: [:create, :show]
  end

  resources :projects do
    resources :events, except: [:show]
  end



  resources :pages, only: [:index]

  resources :users



  resources :tags, only: [:index, :show]

  root to: 'pages#index'

end
