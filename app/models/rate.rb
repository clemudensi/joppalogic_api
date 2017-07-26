class Rate < ApplicationRecord
	belongs_to :courier
	belongs_to :parcel

	extend FriendlyId
	friendly_id :generate_custom_slug, use: :slugged

	before_create :convert_to_lowercase_from, :convert_to_lowercase_to

	def convert_to_lowercase_from
		self.from_location.downcase!
	end

	def convert_to_lowercase_to
		self.to_location.downcase!
	end

	def generate_custom_slug
		# "#{convert_to_lowercase_to} #{convert_to_lowercase_from}"
		"#{self.id}"
	end
end
