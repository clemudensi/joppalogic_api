
json.meta @meta

json.data do
	json.couriers @rate do |r|
	json.from		r.from_location
	json.to			r.to_location
	json.price 		r.price
	json.courier 	r.courier.name
	json.rate_id	r.slug
	end
end
