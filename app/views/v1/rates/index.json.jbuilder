json.rate @rates do |r|
	json.from		r.from_area.name
	json.to			r.to_area.name
	json.price 		r.price
	json.slug		r.slug
	json.courier_id r.courier.name
end
