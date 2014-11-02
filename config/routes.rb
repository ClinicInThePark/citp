Rails.application.routes.draw do
  

  resources :users 

  #currently breaks the code if not commented out.
  #used for validating for real emails
  #resources :account_activations, only: [:edit]  

  resources :posts
  resources :sessions, only: [:new,:create,:destroy]
 
  

  root 'sessions#new'
  
  match '/signin',	     to: 'sessions#new', 			      via: 'get'
  match '/signout',      to: 'sessions#destroy', 		    via: 'delete'
  match '/signup',	     to: 'users#new',				        via: 'get'
  match '/home',         to: 'sessions#index',          via: 'get'
  match '/help', 	       to: 'static_pages#help', 		  via: 'get'
  match '/about',	       to: 'static_pages#about',		  via: 'get'
  match '/contact',      to: 'static_pages#contact', 	  via: 'get'
  

end
