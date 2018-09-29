Rails.application.routes.draw do
  
  devise_for :users  
	resources :posts do
		resources :comments
   end
  

  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'


end
