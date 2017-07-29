json.meta @meta
json.data do 
	json.parcels @parcels do |p|
		json.(p, :sender_name, :sender_phone_number, :receiver_name, :receiver_phone_number)
	end
end