Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_for :makers, :controllers => { registrations: 'makers/registrations' }
  
  root 'welcome#home'
  resources :users
  resources :makers
  resources :products

  get 'search', to: 'search#search'
end
