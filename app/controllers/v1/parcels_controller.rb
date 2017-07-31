class V1::ParcelsController < ApplicationController
	require 'httparty'
	skip_before_action :current_user, except: [:get_user_parcels, :index]

	def index
		@parcels = Parcel.all
		render :index
	end

	def create

		user = RealUser.find_by_phone_number(params['parcel_from']['phone_number'])
		if !user
		 		user = RealUser.new()

		 		r = Random.new
				r = r.rand(100000...999999)
			
		 		user.full_name =	params['parcel_from']['name']
		 		user.password = 	r.to_s
		 		user.phone_number = params['parcel_from']['phone_number']
		 		user.save
		 	end

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
	      @parcel.sender_address                 		= params['parcel_from']['address']
	      @parcel.receiver_name                 		= params['parcel_to']['name']
	      @parcel.receiver_phone_number         		= params['parcel_to']['phone_number']
	      @parcel.receiver_email                		= params['parcel_to']['email']
	      @parcel.receiver_address                		= params['parcel_to']['address']
	      @parcel.real_user_id = user.id
	      rate = Rate.friendly.find_by_slug(params['rate_id'])

	      if rate.nil?
	      	@meta = {code: "200", message: "Wrong rate inputted. Parcel not saved. Please check your rates"}
	      else
			
	      	@parcel.rate_id                    			= rate.id

				if @parcel.save
					message =  "Sender Name: " + params['parcel_from']['name'] + "\n"
			      message += "Sender Phone: " + params['parcel_from']['phone_number'] + "\n"
			      message += "Receiver Name: " + params['parcel_to']['name'] + "\n"
			      message += "Receiver Phone: " + params['parcel_to']['phone_number'] + "\n"
			      message += "Description: " + params['parcel_description'] + "\n"
			      message += "Category: " + params['category'] + "\n"
			      message += "Vehicle Type: " + params['vehicle_type'] + "\n"
			      message += "Delivery Address: " + params['parcel_to']['address'] + "\n"
			      message += "Pickup Address: " + params['parcel_from']['address'] + "\n"
			      #the onboarding message sent to the user
		 		onboarding_message = "Welcome to JoppaLogic.\nYour passcode is #{r}."
				send_message("+233#{user.phone_number}",onboarding_message)
			      notify_slack(message)
			      
					@meta = {code: "201", message: "Parcel created."}
					render :create, status: :created
				else
					@meta = {code: "400", message: "An error occured during creation."}
					head(:unprocessable_entity)
				end
	      end
	      

	end

	def update
	end

	def show
	end

	def destroy
	end

	def get_rates
		vehicle_type		= params['vehicle_type']
		category		    = params['category']
 		from_area      		= params['parcel_from']['area']
    	to_area  			= params['parcel_to']['area']

    if(from_area.length > 1 && to_area.length > 1)
			from = Area.find_by_slug(from_area)
			to = Area.find_by_slug(to_area)

			@rate = get_prices(from,to,vehicle_type)
			if @rate.size > 0
				@meta = {code: "200", message: "Address successfully retrieved."}
			else
				@meta = {code: "204", message: "Realtime rates not available for this route."}
				message = "Unavailable rates: Parcel from: #{from}, #{to}"
				notify_slack(message)
			end
		else
			@meta = {code: "400", message: "Invalid Address."}
			message = "Invalid params: Parcel from: Parcel from: #{from}, #{to}"
			notify_slack(message)
		end
		
		render :rate
	end

	def get_user_parcels
		user = RealUser.find_by_phone_number(params[:phone_number])
		if user
			@parcels = Parcel.where(sender_phone_number: params[:phone_number])
		else
		end

		render :user_parcels
	end



	private

	# def get_locality(the_lat,the_lng)
	# 	key = "AIzaSyD64zGY94u6kt_BgVyNhilzxhBEJfD0ST4"
	# 	area = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?latlng="+ the_lat +","+ the_lng +"&key="+ key)
	# 	area  = area["results"][1]["address_components"][0]["long_name"]
	# end

	def get_prices(from,to,vehicle_type)
		rate = Rate.where("from_area_id = ? AND to_area_id = ?", from, to)
		rate
	end

 	def notify_slack(message)
 	# 	notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
  # 		defaults channel: "#production_log",
  #          username: "get_rates_endpoint"
		# end

		notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
	  		defaults channel: "#staging_log",
	           username: "netlify_hooks"
	       end

		notifier.ping message
 	end

 	 def send_message(to, message)
		SmsghSms.api_client_id = "aoblnanr"
		SmsghSms.api_client_secret = "dfltzevp"
		SmsghSms.push(:to => to, :msg => message, :from => "JoppaLogic")
	end
end