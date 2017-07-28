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
# Rate.delete_all
# Courier.delete_all
# Parcel.delete_all
# User.delete_all

# courier1 = Courier.create(
# 			name: "Jerry Express",
# 			phone: "+233 (0) 265231422",
# 			web_url: "http://www.jerry.com",
# 			description: "Jerry delivers within Ghana",
# 			active: true,
# 			capabilities: ["International shipping","Local shipping"],
# 			parameters: {username: "joppalogic",
# 						password: "joppa+logic"}
# 			)
# courier1.rates.create(
# 			from_location: "East Legon",
# 			to_location: "East Legon",
# 			price: 5.00)

# courier1.rates.create(
# 			from_location: "East Legon",
# 			to_location: "Madina",
# 			price: 7.00)

# courier1.rates.create(
# 			from_location: "East Legon",
# 			to_location: "Adjinganor",
# 			price: 6.00)

# courier1.rates.create(
# 			from_location: "East Legon",
# 			to_location: "Adenta",
# 			price: 10.00)

# courier1.rates.create(
# 			from_location: "East Legon",
# 			to_location: "Frafraha",
# 			price: 12.00)

# courier1.rates.create(
# 			from_location: "East Legon",
# 			to_location: "Dodowa",
# 			price: 20.00)

# courier1.rates.create(
# 			from_location: "East Legon",
# 			to_location: "Legon",
# 			price: 5.00)

# courier1.rates.create(
# 			from_location: "East Legon",
# 			to_location: "Hatso",
# 			price: 8.00)

# courier1.rates.create(
# 			from_location: "East Legon",
# 			to_location: "Westlands",
# 			price: 5.00)

Role.create(name: "joppalogic")
Role.create(name: "logistics_super_admin")
Role.create(name: "logistics_admin")
Role.create(name: "logistics_staff")
Role.create(name: "logistics_super_admin")

