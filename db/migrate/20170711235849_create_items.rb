class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
    	t.string	:description
    	t.integer	:quantity	
    	t.float		:price
    	t.string 	:currency
    	t.float		:weight
    	t.string 	:unit
        #parcel not needed in items
    	t.string	:parcel_number
    	t.integer 	:parcel_id
    	t.string 	:item_number

      	t.timestamps
    end

    add_foreign_key :items, :parcels
  end
end
