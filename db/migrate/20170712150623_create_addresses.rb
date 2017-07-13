class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
    	t.string 	:name
    	t.string 	:phone_number
    	t.string 	:alternate_phone_number
    	t.string 	:fax
    	t.string 	:email
    	t.string 	:company_name
    	t.string 	:street
    	t.string 	:city
    	t.string 	:state
    	t.string 	:country
    	t.boolean :validated
    	t.integer	:parcel_id

      t.timestamps
    end
  end
end
