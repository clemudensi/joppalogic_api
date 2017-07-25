class Rate < ApplicationRecord
	belongs_to :courier

	before_create :convert_to_lowercase_from, :convert_to_lowercase_to

	def convert_to_lowercase_from
		self.from_location.downcase!
	end

	def convert_to_lowercase_to
		self.to_location.downcase!
	end
end
