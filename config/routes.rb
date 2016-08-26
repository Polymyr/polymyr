Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_for :makers, :controllers => { registrations: 'makers/registrations' }

  authenticated :user do
    root to: 'general#home', as: :user_root
  end

  authenticated :maker do
    root to: 'makers#show', as: :maker_root
  end
  
  unauthenticated do
    root to: 'prospects#new', as: :unauthenticated_root
  end

  resources :users
  resources :makers do
    member do
      get :payment
    end
  end
  resources :products do
    resources :build, controller: 'products/build'
    resources :uploads, only: [:new, :create, :destroy]
  end
  resources :reviews do
    resources :build, controller: 'reviews/build'
  end
  resources :charges
  resources :prospects, only: [:new, :create]

  get '/search', to: 'search#search'
  get '/about', to: 'general#about'
  get '/', to: 'general#home'
  get '/dash/:id', to: 'products#dash', as: 'dash'
  get '/thanks', to: 'prospects#thanks'
  get '/stripe_connect', to: 'makers#stripe_connect'
end
