json.array! @parcels do |parcel|
		json.vehicle_type			parcel.vehicle_type
    	json.dimension_width	parcel.dimension_width
    	json.dimension_height	parcel.dimension_height
    	json.dimension_depth	parcel.dimension_depth
    	json.dimension_unit		parcel.dimension_unit
    	json.parcel_description	parcel.parcel_description
    	json.weight_value		parcel.weight_value
    	json.weigh_unit			parcel.weigh_unit
    	json.parcel_number		parcel.parcel_number
    	json.created_by			parcel.created_by

        # json.items parcel.items do |item|
        #     json.(item,
        #         :description, 
        #         :quantity, 
        #         :price, 
        #         :currency, 
        #         :weight, 
        #         :unit, 
        #         :parcel_number, 
        #         :parcel_id, 
        #         :item_number)
        # end
end

