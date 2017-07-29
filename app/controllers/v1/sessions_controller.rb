class V1::SessionsController < Devise::SessionsController
# class V1::SessionsController < ApplicationController
	# skip_before_filter :authenticate_user_from_token!
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