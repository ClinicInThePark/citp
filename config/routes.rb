Rails.application.routes.draw do
  
  #connects controllers to the existing routes. 
  #Allows for controllers to direct/redirect REST calls in 
  #the rails app.
  resources :users 
  resources :posts
  resources :sessions, only: [:new,:create,:destroy]
  resources :booths
  resources :events
 
  

  #custom routes we want our rails app to have. Allows 
  #you to link a controller route to another route by specifying
  #a different relative path.
  root 'sessions#new'
  
  match '/search',       to: 'users#search',            via: 'get' 
  match '/users',        to: 'users#index',             via: 'get'
  match '/signin',	     to: 'sessions#new', 			      via: 'get'
  match '/signout',      to: 'sessions#destroy', 		    via: 'delete'
  match '/signup',	     to: 'users#new',				        via: 'get'
  match '/home',         to: 'sessions#index',          via: 'get'


end
