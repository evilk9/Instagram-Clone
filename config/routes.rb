Rails.application.routes.draw do
  
  root 'users#index'
  devise_for :users
  resources :users do
  	resources :pictures
  	member do
  		get :following, :followers
  	end
  end

  resources :relationships, only: [:create, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
