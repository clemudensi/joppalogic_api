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
    	t.string	:parcel_number
        t.string    :category

        #sender details
        t.string    :sender_name
        t.string    :sender_phone_number
        t.string    :sender_alternate_phone_number
        t.string    :sender_email
        t.string    :sender_street
        t.string    :sender_city
        t.string    :sender_state
        t.string    :sender_country
        t.string    :sender_address

        #receiver details
        t.string    :receiver_name
        t.string    :receiver_phone_number
        t.string    :receiver_alternate_phone_number
        t.string    :receiver_email
        t.string    :receiver_street
        t.string    :receiver_city
        t.string    :receiver_state
        t.string    :receiver_country
        t.string    :receiver_address

    	t.integer 	:created_by



      t.timestamps
    end
  end
end
