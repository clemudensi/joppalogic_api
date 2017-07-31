class Parcel < ApplicationRecord
	has_one :rate
	# has_one :category
	# has_one :vehicle_type
	belongs_to :real_user
end
