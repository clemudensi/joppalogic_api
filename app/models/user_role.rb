class UserRole < ApplicationRecord
  belongs_to :real_user
  belongs_to :role
end
