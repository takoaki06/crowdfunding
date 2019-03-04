Rails.application.routes.draw do

  resources :products
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }

  resources :users, only: [:show, :index, :edit, :update]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "top#index"

end
