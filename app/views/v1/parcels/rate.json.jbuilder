
json.rate @rate do |r|
	json.from	r.from_location.capitalize
	json.to		r.to_location.capitalize
	json.price 	r.price
	json.courier_id r.courier_id
end

# json.rate @rate