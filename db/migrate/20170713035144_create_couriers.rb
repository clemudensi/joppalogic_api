class CreateCouriers < ActiveRecord::Migration[5.0]
  def change
    create_table :couriers do |t|

    

      t.timestamps
    end
  end
end
