Rails.application.routes.draw do

  resources :products
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }

  resources :users, only: [:show, :index, :edit, :update]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
   namespace :admin do
    resources :products
   end



  root "top#index"

end
