class CreateRealUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :real_users do |t|

    	t.string :full_name
      t.string :email
      t.string :phone_number
      t.string :password_digest

      t.timestamps
    end
  end
end
