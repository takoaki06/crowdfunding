Rails.application.routes.draw do

  get 'watchings/index'
  resources :products, only: [:show, :index] do
    resources :investments, only: [:index, :new, :create]
    resources :likes, only: [:create, :destroy]
  end

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }

  resources :users, only: [:show, :index, :edit, :update]

  
  namespace :admin do
    resources :products
  end

  namespace :administer do
    get 'investments', to: 'investments#index'
    resources :categories
  end

  root "top#index"

end
