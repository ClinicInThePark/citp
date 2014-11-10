Rails.application.routes.draw do
  

  resources :users 

  #currently breaks the code if not commented out.
  #used for validating for real emails
  #resources :account_activations, only: [:edit]  

  resources :posts
  resources :sessions, only: [:new,:create,:destroy]
  resources :booths
  resources :events
 
  

  root 'sessions#new'
  
  match '/signin',	     to: 'sessions#new', 			      via: 'get'
  match '/signout',      to: 'sessions#destroy', 		    via: 'delete'
  match '/signup',	     to: 'users#new',				        via: 'get'
  match '/home',         to: 'sessions#index',          via: 'get'


end
