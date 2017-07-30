class Area < ApplicationRecord
	has_many :from_rates, :class_name => 'Rate', :foreign_key => 'from_area_id'
	has_many :to_rates, :class_name => 'Rate', :foreign_key => 'to_area_id'

	before_create :create_slug
	def create_slug
		self.slug =  self.name.strip.downcase.parameterize('-')
	end
end
