# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user1 = User.create(
# 		email: "ayo@gmail.com",
# 		password: "ayo@gmail.com"
# 		)

courier1 = Courier.create(
			slug: "fedex slug",
			name: "fedex",
			phone: "+233 (0) 265231422",
			web_url: "http://www.fedex.com",
			description: "Internation ni o",
			active: true,
			account_id: "12345",
			capabilities: ["International shipping","Local shipping"],
			parameters: {username: "joppalogic",
										password: "joppa+logic"}
			)

courier2 = Courier.create(
			slug: "ups slug",
			name: "UPS",
			phone: "+233 (0) 265231422",
			web_url: "http://www.jups.com",
			description: "Internation ni o",
			active: true,
			account_id: "12345",
			capabilities: ["International shipping","Local shipping"],
			parameters: {username: "joppalogic",
										password: "joppa+logic"}
			)

courier2 = Courier.create(
			slug: "dhl slug",
			name: "dhl",
			phone: "+233 (0) 265231422",
			web_url: "http://www.dhl.com",
			description: "Internation ni o",
			active: true,
			account_id: "12345",
			capabilities: ["International shipping","Local shipping"]
			)