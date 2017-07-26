class Parcel < ApplicationRecord
	has_one :rate
	belongs_to :user
end
