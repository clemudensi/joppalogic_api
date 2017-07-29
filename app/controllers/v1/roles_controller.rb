class V1::RolesController < ApplicationController
	# skip_before_action :current_user

	def index
		@roles = Role.all
		render :index
	end

	def create
		@role = Role.new(role_params)
		if @role.save
			render :create, status: :created
		else
			head(:unprocessable_entity)
		end
	end

	# def show
	# end

	# def update
	# 	if @role.update(role_params)
	# 		render :update
	# 	else
	# 		head(:unprocessable_entity)
	# 	end
	# end

	def destroy
	end

	private

	def role_params
		params.require(:role).permit(:user_id, :role_id)
	end

end