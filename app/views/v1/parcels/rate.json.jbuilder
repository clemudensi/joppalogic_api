
json.meta @meta

json.data do
	json.couriers @rate do |r|
	json.from		r.from_area.name
	json.to			r.to_area.name
	json.price 		r.price
	json.courier 	r.courier.name
	json.rate_id	r.slug
	end
end
