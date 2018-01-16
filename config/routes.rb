Rails.application.routes.draw do
	root to: 'pages#home'

	get 'pages/home'

	devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :events, except: [:destroy]
	resources :categories
	resources :profiles, only: [:new, :edit, :create, :update]
end
