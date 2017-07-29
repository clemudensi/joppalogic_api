module V1
class UsersController < ApplicationController
	skip_before_action :current_user, only: [:create]
	before_action :set_user, only: [:update]


	def index
		@users = RealUser.all
	end

	def create
		@user = RealUser.new(user_params)

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

	def create_user_role
		@user_role =  UserRole.new
		@user_role.user_id = params["user_id"]
		@user_role.role_id = params["role_id"]
	end

	def delete_user_role
		@user = UserRole.find_by_id(params[:id])

		# if @user.destroy
		# 	# render :json{""}
		# end
	end

	private

	def user_params
		params.require(:user).permit(
									:email, 
									:password, 
									:full_name,
									:phone_number,
									:country_code)
	end

	def user_role_params
		permit.require(:user_role).permit(
								:user_id,
								:role_id)
	end

	def set_user
		@user = RealUser.find(params[:id])
	end
end
end