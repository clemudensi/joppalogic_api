class V1::ParcelsController < ApplicationController
	skip_before_action :current_user

	def index
		@parcels = Parcel.all
		render :index
	end

	def create
		@parcel = Parcel.new

			@parcel.vehicle_type			    						= params['vehicle_type']
			@parcel.dimension_width	  								= params['dimension_width']
			@parcel.dimension_height	  							= params['dimension_height']
			@parcel.dimension_depth	  								= params['dimension_depth']
			@parcel.dimension_unit		  							= params['dimension_unit']
			@parcel.parcel_description	           		= params['parcel_description']
			@parcel.weight_value		               		= params['weight_value']
			@parcel.weigh_unit			               		= params['weigh_unit']
			@parcel.parcel_number		             			= params['parcel_number']
			@parcel.category		             					= params['category']
      @parcel.sender_name                   		= params['parcel_from']['name']
      @parcel.sender_phone_number           		= params['parcel_from']['phone_number']
      @parcel.sender_alternate_phone_number 		= params['parcel_from']['alternate_phone_number']
      @parcel.sender_email                  		= params['parcel_from']['email']
      @parcel.sender_street                 		= params['parcel_from']['street']
      @parcel.sender_city                   		= params['parcel_from']['city']
      @parcel.sender_state                  		= params['parcel_from']['state']
      @parcel.sender_country                		= params['parcel_from']['country']
      @parcel.sender_address               			= params['parcel_from']['address']
      @parcel.receiver_name                 		= params['parcel_to']['name']
      @parcel.receiver_phone_number         		= params['parcel_to']['phone_number']
      @parcel.receiver_alternate_phone_number 	= params['parcel_to']['alternate_phone_number']
      @parcel.receiver_email                		= params['parcel_to']['email']
      @parcel.receiver_street               		= params['parcel_to']['street']
      @parcel.receiver_city                 		= params['parcel_to']['city']
      @parcel.receiver_state                		= params['parcel_to']['state']
      @parcel.receiver_country              		= params['parcel_to']['country']
      @parcel.receiver_address              		= params['parcel_to']['address']
      @parcel.created_by                    		= params['created_by']
		if @parcel.save

			#save the user if this is the first instance of its occurence
			@rates = Courier.all
			render :create, status: :created
		else
			head(:unprocessable_entity)
		end

	end

	def update
	end

	def show
	end

	def destroy
	end

	# private

	# def parcel_params
	# 	params.require(:parcel).permit(
	# 								:vehicle_type,
	# 							    :dimension_width,
	# 							    :dimension_height,
	# 							    :dimension_depth,
	# 							    :dimension_unit,
	# 							    :parcel_description,
	# 							    :weight_value,
	# 							    :weigh_unit,
	# 							    :parcel_number,
	# 							    :sender_name,
	# 							    :sender_phone_number,
	# 							    :sender_alternate_phone_number,
	# 							    :sender_email,
	# 							    :sender_street,
	# 							    :sender_city,
	# 							    :sender_state,
	# 							    :sender_country,
	# 							    :receiver_name,
	# 							    :receiver_phone_number,
	# 							    :receiver_alternate_phone_number,
	# 							    :receiver_email,
	# 							    :receiver_street,
	# 							    :receiver_city,
	# 							    :receiver_state,
	# 							    :receiver_country,
	# 							    :created_by)
	# end
end