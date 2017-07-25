class V1::ParcelsController < ApplicationController
	require 'httparty'
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
      @parcel.sender_longitude               		= params['parcel_from']['longitude']
      @parcel.sender_latitude              			= params['parcel_from']['latitude']
      @parcel.receiver_name                 		= params['parcel_to']['name']
      @parcel.receiver_phone_number         		= params['parcel_to']['phone_number']
      @parcel.receiver_alternate_phone_number 	= params['parcel_to']['alternate_phone_number']
      @parcel.receiver_email                		= params['parcel_to']['email']
      @parcel.receiver_street               		= params['parcel_to']['street']
      @parcel.receiver_city                 		= params['parcel_to']['city']
      @parcel.receiver_state                		= params['parcel_to']['state']
      @parcel.receiver_country              		= params['parcel_to']['country']
      @parcel.receiver_address              		= params['parcel_to']['address']
      @parcel.receiver_longitude               	= params['parcel_to']['longitude']
      @parcel.receiver_latitude              		= params['parcel_to']['latitude']
      @parcel.created_by                    		= params['created_by']
		if @parcel.save

			#save the user if this is the first instance of its occurence
			# @user = User.where(:sender_phone_number params['parcel_from']['phone_number'])
			 @user = User.find_by_phone_number(params['parcel_from']['phone_number'])
			 if !@user
			 		@user = User.new()
			 		@user.email = params['parcel_from']['email']
			 		@user.password = "ayod@gil.com"
			 		@user.phone_number = params['parcel_from']['phone_number']
			 		@user.country_code = params['+234']
			 		@user.save
			 	end

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

	def get_rates
		vehicle_type			= params['vehicle_type']
		category		      = params['category']
 		from_lng      						= params['parcel_from']['longitude']
    from_lat          				= params['parcel_from']['latitude']
    to_lng 										= params['parcel_to']['longitude']
    to_lat  									= params['parcel_to']['latitude']

		from = get_locality(from_lat,from_lng)
		to =get_locality(to_lat,to_lng)

		@rate = get_prices(from,to,vehicle_type)
		render :rate

		# if @rate.count > 1
		# 	render :rate
		# else
		# 	render json: {status: "error", code: 400, message: "No value was returned. Please check address"}
		# end

	end

	private

		def get_locality(the_lat,the_lng)
		key = "AIzaSyD64zGY94u6kt_BgVyNhilzxhBEJfD0ST4"
		area = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?latlng="+ the_lat +",%20"+ the_lng +"&key="+ key)
		area  = area["results"][1]["address_components"][0]["long_name"]
	end

	def get_prices(from,to,vehicle_type)
		from = from.downcase!
		to = to.downcase!
		rate = Rate.where("from_location = ? AND to_location = ?", from, to)
	end

end