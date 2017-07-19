Rails.application.routes.draw do



	namespace :v1, defaults: {format: :json} do
		devise_for :users, skip: :all

		devise_scope :v1_user do
  			post 	"/sessions" => "sessions#create"
        	delete  "/sessions" => "sessions#destroy"
        	
  		end

		resources :couriers, only: [:index]
		resources :users, only: [:index,:create,:update]
		resources :parcels
		resources :items, only: [:index]
		resources :tokens , only: [] do
			member do
				post :verify, :resend
			end
		end

		
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
