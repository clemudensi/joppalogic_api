Rails.application.routes.draw do
  devise_for :users
	namespace :v1, defaults: {format: :json} do
		resources :items
		resources :sessions, only: [:create, :destroy]
		resources :users, only: [:index,:create,:update]
		resources :parcels
		resources :items, only: [:index]
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
