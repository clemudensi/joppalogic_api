class AddImageUrlToCourierCompany < ActiveRecord::Migration[5.0]
  def change
  	add_column :couriers, :image_url , :string, :default => "" 
  end
end
