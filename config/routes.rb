Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new,:create,:destroy]
  resources :microposts
  resources :posts, only: [:edit]

  root 'static_pages#home'
  
  match '/signin',	to: 'sessions#new', 			via: 'get'
  match '/signout', to: 'sessions#destroy', 		via: 'delete'
  match '/signup',	to: 'users#new',				via: 'get'
  match '/help', 	  to: 'static_pages#help', 		via: 'get'
  match '/about',	  to: 'static_pages#about',		via: 'get'
  match '/contact', to: 'static_pages#contact', 	via: 'get'

end
