Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_for :makers, :controllers => { registrations: 'makers/registrations' }
  
  root 'prospects#new'
  resources :users
  resources :makers
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
  get '/dash/:id', to: 'products#dash', as: 'dash'
end
