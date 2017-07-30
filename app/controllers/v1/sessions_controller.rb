class V1::SessionsController < ApplicationController

	skip_before_action :current_user
	
	require 'auth_token'

	def create

		user = RealUser.where(email: params[:email]).first

		 if user && user.authenticate(params[:password]) #user && user.valid
			@auth_token = AuthToken.issue_token({user_id: user.id})

			render :create, status: :created
		else
			head(:unauthorized)
		end
	end

	def verify_merchant
		user = RealUser.where(phone_number: params[:phone_number]).first

		 if user && user.authenticate(params[:password]) #user && user.valid
		 	@auth_token = AuthToken.issue_token({user_id: user.id})

			render :create, status: :created
		else
			head(:unauthorized)
		end
	end

	def resend_token
		user = RealUser.find_by_phone_number(params[:phone_number])
		r = Random.new
		r = r.rand(100000...999999)

		if user.update_attributes(password: r.to_s)

		update_message = "Your JoppaLogic passcode has been updated.\nYour new passcode is #{r}."
		send_message("+233#{user.phone_number}", update_message)
		@meta = {code: "201", message: "Your token has been reset."}
		render :resend_token
		else
			head(:unprocessable_entity)
			@meta = {code: "400", message: "Your token could not be reset. Please contact JoppaLogic."}
			render :resend_token
		end
		#update the password field with a new password and send to the user
	end


	def destroy
	end

	private

	 def send_message(to, message)
		SmsghSms.api_client_id = "aoblnanr"
		SmsghSms.api_client_secret = "dfltzevp"
		SmsghSms.push(:to => to, :msg => message, :from => "JoppaLogic")
	end
end