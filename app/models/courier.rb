class Courier < ApplicationRecord
	has_many :rates
	has_many :users
end
