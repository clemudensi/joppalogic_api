class CreateCouriers < ActiveRecord::Migration[5.0]
  def change
    create_table :couriers do |t|

    	t.string 	:slug
    	t.string 	:name
    	t.string 	:phone
    	t.string 	:web_url
    	t.string 	:description
    	t.string 	:courier_id
    	t.boolean	:active
    	t.string 	:account_id
    	t.text		:capabilities, array: true, default: []
    	t.json		:parameters

      t.timestamps
    end

  end
end
