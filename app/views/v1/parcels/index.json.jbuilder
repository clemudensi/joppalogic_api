json.array! @parcels do |parcel|
		json.box_type			parcel.box_type
    	json.dimension_width	parcel.dimension_width
    	json.dimension_height	parcel.dimension_height
    	json.dimension_depth	parcel.dimension_depth
    	json.dimension_unit		parcel.dimension_unit
    	json.parcel_description	parcel.parcel_description
    	json.weight_value		parcel.weight_value
    	json.weigh_unit			parcel.weigh_unit
    	json.parcel_number		parcel.parcel_number
    	json.user_id			parcel.user_id

        json.items parcel.items do |item|
            json.(item,
                :description, 
                :quantity, 
                :price, 
                :currency, 
                :weight, 
                :unit, 
                :parcel_number, 
                :parcel_id, 
                :item_number)
        end
end

