json.data do 
	json.from		@rate.from_area.name
	json.to			@rate.to_area.name
	json.price 		@rate.price
	json.rate_id	@rate.slug
	json.courier 	@rate.courier.name
end
