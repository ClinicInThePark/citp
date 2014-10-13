Rails.application.routes.draw do
  resources :users 
  resources :posts
  resources :post

  resources :sessions, only: [:new,:create,:destroy]
  resources :microposts
  

  root 'sessions#new'
  
  match '/signin',	to: 'sessions#new', 			    via: 'get'
  match '/signout', to: 'sessions#destroy', 		  via: 'delete'
  match '/signup',	to: 'users#new',				      via: 'get'
  match '/help', 	  to: 'static_pages#help', 		  via: 'get'
  match '/about',	  to: 'static_pages#about',		  via: 'get'
  match '/contact', to: 'static_pages#contact', 	via: 'get'
 

end
