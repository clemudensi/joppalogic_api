# # # # This file should contain all the record creation needed to seed the database with its default values.
# # # # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# # # #
# # # # Examples:
 # # #
 #     movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
 #     Character.create(name: 'Luke', movie: movies.first)
        User.create(
          email: "ayo@gmail.com",
          password: "ayo@gmail.com"
    		)
 #Rate.delete_all
 #Courier.delete_all
 #Parcel.delete_all
 #RealUser.delete_all
 #Area.delete_all

 lme_courier = Courier.create(
 			name: "Life Made Easy",
 			phone: "+233 (0) 202020090",
 			image_url: "http://res.cloudinary.com/joppalogic/image/upload/v1501623650/lme_p08nr0.jpg",
 			web_url: "http://www.lme.com",
 			description: "LME delivers within Ghana",
 			active: true,
 			capabilities: ["Local shipping"],
 			parameters: {username: "joppalogic",
 						password: "joppa+logic"}
 			)

 jerry_courier = Courier.create(
 			name: "Jerry Express",
 			phone: "+233 (0) 265231422",
 			image_url: "http://res.cloudinary.com/joppalogic/image/upload/v1501602755/Jerry_2_kozvdz.png",
 			web_url: "http://www.jerry.com",
 			description: "Jerry delivers within Ghana",
 			active: true,
 			capabilities: ["Local shipping"],
 			parameters: {username: "joppalogic",
 						password: "joppa+logic"}
 			)

# require 'csv'

 jerry_csv = File.read(Rails.root.join('lib', 'seeds', 'jerryexpress.csv'))
 lme_csv = File.read(Rails.root.join('lib', 'seeds', 'lme.csv'))
 area_csv = File.read(Rails.root.join('lib', 'seeds', 'Areas.csv'))

 parsed_area = CSV.parse(area_csv, :headers => true, :encoding => 'ISO-8859-1')
 parsed_jerry = CSV.parse(jerry_csv, :headers => true, :encoding => 'ISO-8859-1')
 parsed_lme = CSV.parse(lme_csv, :headers => true, :encoding => 'ISO-8859-1')

 parsed_area.each do |row|
 	a = Area.new
 	a.name = row['Area']
 	a.area_type = "neighbourhood"
 	a.region = "Accra"
 	a.country = "Ghana"
 	a.save
 	 puts "#{a.name} is saved"
 	 puts "#{a.id} is saved"
    puts row.to_hash
 end

 parsed_lme.each do |j|
 		from_area = Area.find_by_slug(j['From'].strip.downcase.parameterize('-'))
 		to_area = Area.find_by_slug(j['To'].strip.downcase.parameterize('-'))
		
 		r = Rate.new
 		r.from_area_id = from_area.id
 		r.to_area_id = to_area.id
 		r.courier_id = lme_courier.id
 		r.price = j['Price'].to_f
 		r.save
 	end

 parsed_jerry.each do |j|
 		from_area = Area.find_by_slug(j['From'].strip.downcase.parameterize('-'))
 		to_area = Area.find_by_slug(j['To'].strip.downcase.parameterize('-'))
		
 		r = Rate.new
 		r.from_area_id = from_area.id
 		r.to_area_id = to_area.id
 		r.courier_id = jerry_courier.id
 		r.price = j['Price'].to_f
 		r.save
 	end
	
 puts "There are now #{Area.count} areas in the database"
 puts "There are now #{Rate.count} areas in the database"
 # puts csv_text
