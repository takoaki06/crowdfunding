Rails.application.routes.draw do

  resources :products, only: [:show, :index] do
    resources :investments, only: [:index, :new, :create]
    resources :likes, only: [:create, :destroy]
  end

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }

  resources :users, only: [:show, :edit, :update]

  
  namespace :admin do
    resources :products
    resources :watchings, only: [:index]
  end

  namespace :administer do
    resources :investments, only: [:index]
    resources :categories
  end

  resources :message_groups do
    post 'message_create', on: :member
  end

  root "products#index"

end
