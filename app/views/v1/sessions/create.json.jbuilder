json.data do
	json.user do
		json.call(
		@user,
		:email,
		:authentication_token
		)
		json.auth_token @auth_token
	end
end