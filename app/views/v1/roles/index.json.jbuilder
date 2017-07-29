json.meta @meta
json.data do
	json.roles @roles do |r|
		json.(r,:id, :name)
	end
end