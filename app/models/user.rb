class User < ApplicationRecord
	# acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :parcels
	has_many :roles

	# # validates :username,  :presence => true, :uniqueness => true
 #  validates :email,     :presence => true, :uniqueness => true, :format => /@/
 #  validates_length_of   :password, :in => 4..20, :on => :create
end
