Rails.application.routes.draw do


  resources :products, only: [:show, :index] do
    resources :investments, only: [:index, :new, :create]
  end

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }

  resources :users, only: [:show, :index, :edit, :update]

  
  namespace :admin do
    resources :products
  end

  root "top#index"

end
