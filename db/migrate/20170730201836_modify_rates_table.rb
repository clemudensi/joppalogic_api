class ModifyRatesTable < ActiveRecord::Migration[5.0]
  def change
  	remove_column :rates, :from_location, :string
  	remove_column :rates, :to_location, :string

  	add_column :rates, :from_area_id, :integer
  	add_column :rates, :to_area_id, :integer

  end
end
