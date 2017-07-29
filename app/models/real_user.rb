class RealUser < ApplicationRecord
	has_secure_password

	has_many :parcels
	has_many :roles, through: :user_roles

	validates :phone_number,     :presence => true, :uniqueness => true
end
