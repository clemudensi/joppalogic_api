json.courier do
	json.name 	@courier.name
	json.phone 	@courier.phone
	json.description	@courier.description

	json.rates @courier.rates do |r|
		json.from		r.from_location.capitalize
		json.to			r.to_location.capitalize
		json.price 		r.price
		json.courier_id r.courier_id
	end
end