class V1::SessionsController < Devise::SessionsController
# class V1::SessionsController < ApplicationController
	# skip_before_filter :authenticate_user_from_token!
	skip_before_filter :verify_jwt_token
	
	def create
		@user = User.where(email: params[:email]).first

		if @user&.valid_password?(params[:password]) #user && user.valid
			@auth_token = JWTWrapper(@user)
			render :create, status: :created
		else
			head(:unauthorized)
		end

	end

	def destroy
	end


end