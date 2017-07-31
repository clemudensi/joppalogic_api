json.meta @meta
json.data do 
	# json.parcels @parcels do |p|
	# 	json.(p, :sender_name, :sender_phone_number, :receiver_name, :receiver_phone_number)
	# end
	json.array! @parcels do |parcel|
		json.vehicle_type			parcel.vehicle_type
    	json.dimension_width	parcel.dimension_width
    	json.dimension_height	parcel.dimension_height
    	json.dimension_depth	parcel.dimension_depth
    	json.dimension_unit		parcel.dimension_unit
    	json.parcel_description	parcel.parcel_description
    	json.weight_value		parcel.weight_value
    	json.weigh_unit			parcel.weigh_unit
    	json.created_by			parcel.created_by
    	json.rate_id			parcel.rate_id
end
end