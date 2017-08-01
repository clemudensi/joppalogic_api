json.courier @couriers do |c|
	json.(c, :id, :slug, :name, :phone,:web_url, :image_url, :description,:capabilities, :active, :parameters)
end