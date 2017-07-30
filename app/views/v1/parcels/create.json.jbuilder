json.meta @meta
json.data do
	json.parcel do
		  json.vehicle_type			    @parcel.vehicle_type
    	json.dimension_width	  @parcel.dimension_width
    	json.dimension_height	  @parcel.dimension_height
    	json.dimension_depth	  @parcel.dimension_depth
    	json.dimension_unit		  @parcel.dimension_unit
    	json.parcel_description	           @parcel.parcel_description
    	json.weight_value		               @parcel.weight_value
    	json.weigh_unit			               @parcel.weigh_unit
      json.created_by                    @parcel.real_user.full_name
      json.category                      @parcel.category

      json.parcel_from do
        json.name                   @parcel.sender_name
        json.phone_number           @parcel.sender_phone_number
        json.email                  @parcel.sender_email
        json.address                @parcel.sender_address
      end
      
      json.parcel_to do
        json.name                 @parcel.receiver_name
        json.phone_number         @parcel.receiver_phone_number
        json.email                @parcel.receiver_email
        json.address              @parcel.receiver_address
      end

      json.user @parcel.real_user.phone_number
	end
end