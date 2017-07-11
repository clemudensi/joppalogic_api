json.data do 
	json.user do
		json.id 		@user.id
		json.email 		@user.email
		json.firstname @user.firstname
		json.lastname	@user.lastname
		json.phonenumber	@user.phonenumber
		json.alt_phone_number	@user.alternate_phone_number
		#and ann the other parameters
	end
end