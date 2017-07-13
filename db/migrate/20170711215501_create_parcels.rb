class CreateParcels < ActiveRecord::Migration[5.0]
  def change
    create_table :parcels do |t|
    	t.string 	:box_type
    	t.float 	:dimension_width
    	t.float		:dimension_height
    	t.float		:dimension_depth
    	t.string 	:dimension_unit
    	t.string 	:parcel_description
    	t.float		:weight_value
    	t.string 	:weigh_unit
    	t.string	:parcel_number
    	t.integer 	:user_id

      t.timestamps
    end
  end
end
