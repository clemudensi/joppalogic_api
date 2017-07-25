class User < ApplicationRecord
	# acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :parcels
	# has_many :roles

# 	validates :username,  :presence => true, :uniqueness => true
	# validates :phone_number,     :presence => true, :uniqueness => true
	# validates :country_code,     :presence => true
end
