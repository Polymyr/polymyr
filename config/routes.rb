Rails.application.routes.draw do
  devise_for :makers
  devise_for :users

  root 'home#index'
end
