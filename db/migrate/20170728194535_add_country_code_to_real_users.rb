class AddCountryCodeToRealUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :real_users, :country_code, :string
  end
end
