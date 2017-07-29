class Parcel < ApplicationRecord
	has_one :rate
	belongs_to :real_user
end
