class ModifyParcelTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :parcels, :sender_longitude, 		:string
  	add_column :parcels, :sender_latitude, 		:string
  	add_column :parcels, :receiver_longitude, 	:string
  	add_column :parcels, :receiver_latitude, 	:string
  end
end
