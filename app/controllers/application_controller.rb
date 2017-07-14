class ApplicationController < ActionController::API

	# before_action :authenticate_user!
	before_filter :verify_jwt_token

	# private

	def verify_jwt_token
		head :unauthorized if request.headers['Authorization'].nil? || !AuthToken.valid?(request.headers['Authorization'].split(' ').last)
	end
end
