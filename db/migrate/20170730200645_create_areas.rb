class CreateAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :areas do |t|
      t.string :name
      t.string :slug
      t.string :area_type
      t.string :region
      t.string :country

      t.timestamps
    end
  end
end
