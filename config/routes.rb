Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_for :makers, :controllers => { registrations: 'makers/registrations' }
  
  root 'general#home'
  resources :users
  resources :makers
  resources :products
  resources :reviews
  resources :charges

  get '/search', to: 'search#search'
end
