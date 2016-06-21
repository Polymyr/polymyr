Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_for :makers, :controllers => { registrations: 'makers/registrations' }
  
  root 'general#home'
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

  get '/search', to: 'search#search'
end
