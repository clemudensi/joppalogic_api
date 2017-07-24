class V1::NotificationsController < ApplicationController
	skip_before_action :current_user
	
	def message
		#try it in school to verify what is obstruction the sending
		@the_message = send_message
		render :message_notice
	end

	private

	def send_message()
		SmsghSms.api_client_id = "aoblnanr"
		SmsghSms.api_client_secret = "dfltzevp"
		SmsghSms.push(:to => '+233265231422', :msg => "This is a test message")
	end
end