Rails.application.routes.draw do
  resources :messages
  resources :rooms
  root 'home#index'
  devise_for :users


end
