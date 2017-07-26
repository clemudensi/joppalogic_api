json.rate @rates do |r|
	json.from		r.from_location.capitalize
	json.to			r.to_location.capitalize
	json.price 		r.price
	json.slug		r.slug
	json.courier_id r.courier.name
end