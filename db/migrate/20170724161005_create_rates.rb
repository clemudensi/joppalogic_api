class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
    	t.string 	:from_location
    	t.string 	:to_location
    	t.integer :courier_id
    	t.float 	:price

      t.timestamps
    end

    add_foreign_key :rates, :couriers
  end
end
