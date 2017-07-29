Rails.application.routes.draw do



	namespace :v1, defaults: {format: :json} do
		devise_for :users, skip: :all

		devise_scope :v1_user do
  			post 	"/sessions" => "sessions#create"
        	delete  "/sessions" => "sessions#destroy"
        	
  		end

		resources :couriers, only: [:index,:show]
		resources :users, only: [:index,:create,:update] do
			collection do
				post :create_user_role
			end
		end
		resources :parcels do
			collection do
				post :get_rates
			end
		end
		# resources :items, only: [:index]
		resources :rates
		resources :roles
	end

	namespace :v1 do

		resources :hooks, only: [] do
			collection do
				post :get_parcel
			end
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
