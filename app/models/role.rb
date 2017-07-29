class Role < ApplicationRecord
	has_many :real_users, through: :user_roles
end
