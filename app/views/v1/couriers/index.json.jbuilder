json.courier @couriers do |c|
	json.(c, :slug, :name, :phone,:web_url, :description,:capabilities, :active, :parameters)
end