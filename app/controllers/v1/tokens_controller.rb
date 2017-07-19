class V1::TokensController < ApplicationController
	# skip_before_action :current_user
	
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
end