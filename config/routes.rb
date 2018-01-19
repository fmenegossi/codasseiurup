Rails.application.routes.draw do
	root to: 'pages#home'

	get 'pages/home'
	get "about" => "pages#about"

	devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :events, except: [:destroy] do
		resources :registration, only: [:create]
	end

	resources :categories
	resources :profiles, only: [:new, :edit, :create, :update]
	resources :photos, only: [:destroy]
end
