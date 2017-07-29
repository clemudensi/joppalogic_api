class CreateUserRoles < ActiveRecord::Migration[5.0]
  def change
  	#be sure to remove this migration after it works
  	# drop_table :user_roles

    create_table :user_roles do |t|
      t.references :real_user, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
