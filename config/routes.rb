Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_for :makers, :controllers => { registrations: 'makers/registrations',
  																			sessions: 'makers/sessions',
  																			passwords: 'makers/passwords',
  																			confirmations: 'makers/confirmations',
  																			unlocks: 'makers/unlocks' }

  root 'welcome#home'
  resources :users
  resources :makers
  resources :products
end
