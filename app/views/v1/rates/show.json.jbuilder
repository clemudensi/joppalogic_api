json.data do 
	json.from		@rate.from_location.capitalize
	json.to			@rate.to_location.capitalize
	json.price 		@rate.price
	json.rate_id	@rate.slug
	json.courier 	@rate.courier.name
end
