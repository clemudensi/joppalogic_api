json.data do
	json.array! @users do |user|
		json.full_name user.full_name
		json.email 	user.email
		json.phone_number user.phone_number
	end
end