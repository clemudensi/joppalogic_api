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
    	json.parcel_number		             @parcel.parcel_number
      json.created_by                    @parcel.created_by
      json.category                      @parcel.category

      json.parcel_from do
        json.name                   @parcel.sender_name
        json.phone_number           @parcel.sender_phone_number
        json.alternate_phone_number @parcel.sender_alternate_phone_number
        json.email                  @parcel.sender_email
        json.street                 @parcel.sender_street
        json.city                   @parcel.sender_city
        json.state                  @parcel.sender_state
        json.country                @parcel.sender_country
        json.address                @parcel.sender_address
      end
      
      json.parcel_to do
        json.name                 @parcel.receiver_name
        json.phone_number         @parcel.receiver_phone_number
        json.alternate_phone_number @parcel.receiver_alternate_phone_number
        json.email                @parcel.receiver_email
        json.street               @parcel.receiver_street
        json.city                 @parcel.receiver_city
        json.state                @parcel.receiver_state
        json.country              @parcel.receiver_country
        json.address              @parcel.receiver_address
      end

      json.rates @rates do |r|
        json.amount r.slug
      end

      json.user @user.phone_number
	end
end