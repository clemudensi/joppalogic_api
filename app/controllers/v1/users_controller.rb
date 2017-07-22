module V1
class UsersController < ApplicationController
	skip_before_action :current_user, except: [:update]
	before_action :set_user, only: [:update]


	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)

		if @user.save
				      
			render :create
		else
			head(:unprocessable_entity)
		end
	end

	def update
		if @user.update(user_params)
			render :update
		else
			head(:unprocessable_entity)
		end
	end

	private

	def user_params
		params.require(:user).permit(
									:email, 
									:password, 
									:password_confirmation,
									:firstname,
									:lastname,
									:phone_number,
									:alternate_phone_number,
									:country_code)
	end

	def set_user
		@user = User.find(params[:id])
	end
end
end