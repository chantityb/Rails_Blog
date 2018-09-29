Rails.application.routes.draw do
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
resources :posts do
	resources :comments
   end
end
