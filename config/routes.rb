Rails.application.routes.draw do
  
  devise_for :users  
	resources :posts do
		resources :comments
   end

   resources :contacts, only: [:new, :create]
  

  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'contacts#new'

end
