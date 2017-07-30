# # # This file should contain all the record creation needed to seed the database with its default values.
# # # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# # #
# # # Examples:
# # #
# # #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# # #   Character.create(name: 'Luke', movie: movies.first)
# # # user1 = User.create(
# # # 		email: "ayo@gmail.com",
# # # 		password: "ayo@gmail.com"
# # # 		)
Rate.delete_all
Courier.delete_all
# Parcel.delete_all
# # RealUser.delete_all
Area.delete_all

courier1 = Courier.create(
			name: "Jerry Express",
			phone: "+233 (0) 265231422",
			web_url: "http://www.jerry.com",
			description: "Jerry delivers within Ghana",
			active: true,
			capabilities: ["International shipping","Local shipping"],
			parameters: {username: "joppalogic",
						password: "joppa+logic"}
			)

# area1 = Area.create(
# 	name: "East Legon",
# 	area_type: "neighbourhood",
# 	region: "accra",
# 	country: "Ghana"
# 	)

# area2 = Area.create(
# 	name: "Madina",
# 	area_type: "neighbourhood",
# 	region: "accra",
# 	country: "Ghana"
# 	)

# area3 = Area.create(
# 	name: "Osu",
# 	area_type: "neighbourhood",
# 	region: "accra",
# 	country: "Ghana"
# 	)


# courier1.rates.create(
# 			from_area_id: area1.id,
# 			to_area_id: area1.id,
# 			price: 5.00)

# courier1.rates.create(
# 			from_area_id: area1.id,
# 			to_area_id: area2.id,
# 			price: 7.00)

# courier1.rates.create(
# 			from_area_id: area1.id,
# 			to_area_id: area3.id,
# 			price: 6.00)

# # courier1.rates.create(
# # 			from_area: 1,
# # 			to_area: 1a",
# # 			price: 10.00)

# # courier1.rates.create(
# # 			from_area: 1,
# # 			to_area: 1aha",
# # 			price: 12.00)

# # courier1.rates.create(
# # 			from_area: 1,
# # 			to_area: 1a",
# # 			price: 20.00)

# # courier1.rates.create(
# # 			from_area: 1,
# # 			to_area: 1",
# # 			price: 5.00)

# # courier1.rates.create(
# # 			from_area: 1,
# # 			to_area: 1",
# # 			price: 8.00)

# # courier1.rates.create(
# # 			from_area: 1,
# # 			to_area: 1ands",
# # 			price: 5.00)

# # # Role.create(name: "joppalogic")
# # # Role.create(name: "logistics_super_admin")
# # # Role.create(name: "logistics_admin")
# # # Role.create(name: "logistics_staff")
# # # Role.create(name: "logistics_super_admin")


require 'csv'

jerry_csv = File.read(Rails.root.join('lib', 'seeds', 'jerryexpress.csv'))
area_csv = File.read(Rails.root.join('lib', 'seeds', 'Areas.csv'))
parsed_area = CSV.parse(area_csv, :headers => true, :encoding => 'ISO-8859-1')
parsed_jerry = CSV.parse(jerry_csv, :headers => true, :encoding => 'ISO-8859-1')

parsed_area.each do |row|
	a = Area.new
	a.name = row['Area']
	a.area_type = "neighbourhood"
	a.region = "Accra"
	a.country = "Ghana"
	a.save
	# puts "#{a.name} is saved"
	# puts "#{a.id} is saved"
  # puts row.to_hash
end


parsed_jerry.each do |j|
		from_area = Area.find_by_slug(j['From'].strip.downcase.parameterize('-'))
		to_area = Area.find_by_slug(j['To'].strip.downcase.parameterize('-'))
		
		r = Rate.new
		r.from_area_id = from_area.id
		r.to_area_id = to_area.id
		r.courier_id = courier1.id
		r.price = j['Price'].to_f
		r.save
	end
puts "There are now #{Area.count} areas in the database"
puts "There are now #{Rate.count} areas in the database"
# puts csv_text
