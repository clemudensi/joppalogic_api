class ModifyParcelTableToIncludeUserId < ActiveRecord::Migration[5.0]
  def change
  	remove_column 	:parcels, :created_by
  	add_column 		:parcels, :real_user_id, :integer

  	add_foreign_key :parcels, :real_users
  end
end
