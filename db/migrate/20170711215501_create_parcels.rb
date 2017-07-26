class CreateParcels < ActiveRecord::Migration[5.0]
  def change
    create_table :parcels do |t|
    	t.string 	:vehicle_type
    	t.float 	:dimension_width
    	t.float		:dimension_height
    	t.float		:dimension_depth
    	t.string 	:dimension_unit
    	t.string 	:parcel_description
    	t.float		:weight_value
    	t.string 	:weigh_unit
        t.string    :category

        #sender details
        t.string    :sender_name
        t.string    :sender_phone_number
        t.string    :sender_email
        t.string    :sender_address

        #receiver details
        t.string    :receiver_name
        t.string    :receiver_phone_number
        t.string    :receiver_email
        t.string    :receiver_address
        t.integer   :rate_id

    	t.integer 	:created_by

      t.timestamps
    end
  end
end
