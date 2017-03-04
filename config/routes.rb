Rails.application.routes.draw do

  resources :reviews, only: [:create]
  resources :offers, only: [:create]

  root 'listings#index'
  resources :listings
  devise_for :users
  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
