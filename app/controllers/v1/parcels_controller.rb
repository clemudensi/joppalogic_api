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
			@parcel.category		             					= params['category']
      @parcel.sender_name                   		= params['parcel_from']['name']
      @parcel.sender_phone_number           		= params['parcel_from']['phone_number']
      @parcel.sender_email                  		= params['parcel_from']['email']
      @parcel.receiver_name                 		= params['parcel_to']['name']
      @parcel.receiver_phone_number         		= params['parcel_to']['phone_number']
      @parcel.receiver_email                		= params['parcel_to']['email']
      @parcel.created_by                    		= params['created_by']
      rate = Rate.friendly.find(params['rate_id'])
      @parcel.rate_id                    				= rate.id

		if @parcel.save

			#save the user if this is the first instance of its occurence
			# @user = User.where(:sender_phone_number params['parcel_from']['phone_number'])
			 @user = User.find_by_phone_number(params['parcel_from']['phone_number'])
			 if !@user
			 		@user = User.new()
			 		@user.email = params['parcel_from']['email']
			 		@user.password = "ayod@gil.com"
			 		@user.phone_number = params['parcel_from']['phone_number']
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
 		from_lng      		= params['parcel_from']['lng']
    from_lat          = params['parcel_from']['lat']
    to_lng 						= params['parcel_to']['lng']
    to_lat  					= params['parcel_to']['lat']

    if(from_lat.length > 1 && from_lng.length > 1 && to_lat.length > 1 && to_lng.length > 1)
			from = get_locality(from_lat,from_lng)
			to =get_locality(to_lat,to_lng)

			@rate = get_prices(from,to,vehicle_type)
			if @rate.size > 0
				@meta = {code: "200", message: "Address successfully retrieved."}
			else
				@meta = {code: "204", message: "Realtime rates not available for this route."}
				message = "Unavailable rates: Parcel from: #{from} with lat: #{from_lat} , #{from_lng}/nParcel to: #{to} with lat: #{to_lat}, lng: #{to_lng}"
				notify_slack(message)
			end
		else
			@meta = {code: "400", message: "Invalid Address."}
			message = "Invalid Data: Parcel from: #{from} with lat: #{from_lat} , #{from_lng}/nParcel to: #{to} with lat: #{to_lat}, lng: #{to_lng}"
			notify_slack(message)
		end
		
		render :rate

	end

	private

		def get_locality(the_lat,the_lng)
		key = "AIzaSyD64zGY94u6kt_BgVyNhilzxhBEJfD0ST4"
		area = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?latlng="+ the_lat +","+ the_lng +"&key="+ key)
		area  = area["results"][1]["address_components"][0]["long_name"]
	end

	def get_prices(from,to,vehicle_type)
		from = from.downcase!
		to = to.downcase!
		rate = Rate.where("from_location = ? AND to_location = ?", from, to)
		rate
	end

 def notify_slack(message)
 		notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
  		defaults channel: "#production_log",
           username: "get_rates_endpoint"
		end


		notifier.ping message
 end
end