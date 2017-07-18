class V1::SessionsController < Devise::SessionsController
# class V1::SessionsController < ApplicationController
	# skip_before_filter :authenticate_user_from_token!
	skip_before_action :verify_jwt_token
	
	require 'auth_token'

	def create

		user = User.where(email: params[:email]).first

		 if user&.valid_password?(params[:password]) #user && user.valid
			@auth_token = AuthToken.issue_token({user_id: user.id})

			render :create, status: :created
		else
			head(:unauthorized)
		end
	end

	def verify
		@user = current_user

		#Use Authy to send the verification token
		token = Authy::API.verify(id: @user.authy_id, token: params[:token])

		if token.ok?
			#Mark the user as verified for get /user/:id
			@user.update(verified: true)

		#send an SMS to the user 'success'
		# send_message("You have successfully signed up to Joppalogic services.")
		else
			head(:unprocessable_entity)
		end
	end

	def resend
		@user = current_user
		Authy::API.request_sms(id: @authy_id)
	end

	def destroy
	end

	private

	  # def send_message(message)
   #  	@user = current_user
	  #   twilio_number = ENV['TWILIO_NUMBER']
	  #   account_sid = ENV['TWILIO_ACCOUNT_SID']
	  #   @client = Twilio::REST::Client.new account_sid, ENV['TWILIO_AUTH_TOKEN']
	  #   message = @client.api.accounts(account_sid).messages.create(
	  #     :from => twilio_number,
	  #     :to => @user.country_code+@user.phone_number,
	  #     :body => message
	  #   )
	  # end
end