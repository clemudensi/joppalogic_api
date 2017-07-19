class ApplicationController < ActionController::API

	before_action :current_user

	# protected

	def current_user
		if request.headers['Authorization'].nil? || !AuthToken.valid?(request.headers['Authorization'].split(' ').last)
			head :unauthorized
		else 
			User.find(AuthToken.valid?(request.headers['Authorization'].split(' ').last)[0]["user_id"])
		end
	end

end
