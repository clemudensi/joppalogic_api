class AddSlugToRates < ActiveRecord::Migration[5.0]
  def change
  	add_column 	:rates, :slug, :string
  	add_index 	:rates, :slug, unique: true
  end
end
