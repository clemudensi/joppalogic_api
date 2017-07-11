class V1::SessionsController < Device::SessionsController
	skip_before_filter :authenticate_user_from_token!
	
	def create
		@user = User.where(email: params[:email]).first

		if @user&.valid_password?(params[:password]) #user && user.valid
			auth_token = JWTWrapper(@user)
			render :create, status: :created
		else
			head(:unauthorized)
		end

	end

	def destroy
	end
end