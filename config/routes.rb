Rails.application.routes.draw do
  root 'listings#index'
  resources :listings
  devise_for :users
  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
