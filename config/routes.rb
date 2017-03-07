Rails.application.routes.draw do

  root 'listings#index'
  resources :listings do
    resources :offers, only: [:create]
  end
  devise_for :users
  resources :users, only: [:show] do
    resources :reviews, except: [:show, :index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
