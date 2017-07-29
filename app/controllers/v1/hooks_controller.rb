class V1::HooksController < ApplicationController
	skip_before_action :current_user

	def get_parcel
	    if request.headers['Content-Type'] == 'application/json'
	      data = JSON.parse(request.body.read)
	      receive_json(data)
	    else
	      # application/x-www-form-urlencoded
	      data = params.as_json
	      receive_json(data)
	    end

	    render nothing: true
	    # render :get_parcel
	end


	private 

	def receive_json(data)

		@user = RealUser.find_by_phone_number(data["human_fields"]["Sender Phone"])
		 if !@user
		 		@user = RealUser.new()
		 		@user.full_name =	data["human_fields"]["Sender Name"]
		 		@user.password =	"not_needed"
		 		@user.phone_number = data["human_fields"]["Sender Phone"]
		 		@user.save
		 	end

		@parcel = Parcel.new

		@parcel.vehicle_type			    		= data["human_fields"]["Vehicle Type"]
		@parcel.parcel_description	           		= data["human_fields"]["Description"]
		@parcel.category		             		= data["human_fields"]["Category"]
      @parcel.sender_name                   		= data["human_fields"]["Sender Name"]
      @parcel.sender_phone_number           		= data["human_fields"]["Sender Phone"]
      @parcel.sender_email                  		= data["email"] 
      @parcel.sender_address                  		= data["human_fields"]["Pickup Address"]
      @parcel.receiver_name                 		= data["human_fields"]["Receiver Name"]
      @parcel.receiver_phone_number         		= data["human_fields"]["Receiver Phone"]
      @parcel.receiver_email                		= data["email"]
      @parcel.receiver_address                		= data["human_fields"]["Dropoff Address"]

      rate = Rate.friendly.find(data["human_fields"]["Delivery Cost"])
      @parcel.rate_id                    				= rate.id
      @parcel.real_user_id = @user.id

      if @parcel.save

			message =  "Sender Name: " + data["human_fields"]["Sender Name"] + "\n"
	      message += "Sender Phone: " + data["human_fields"]["Sender Phone"] + "\n"
	      message += "Receiver Name: " + data["human_fields"]["Receiver Name"] + "\n"
	      message += "Receiver Phone: " + data["human_fields"]["Receiver Phone"] + "\n"
	      message += "Description: " + data["human_fields"]["Description"] + "\n"
	      message += "Category: " + data["human_fields"]["Category"] + "\n"
	      message += "Vehicle Type: " + data["human_fields"]["Vehicle Type"] + "\n"
	      message += "Delivery Address: " + data["human_fields"]["Dropoff Address"] + "\n"
	      message += "Pickup Address: " + data["human_fields"]["Pickup Address"] + "\n"
	      message += "First Name: " + data["first_name"] + "\n"
	      message += "Last Name: " + data["last_name"] + "\n"
	      message += "Email: " + data["email"] + "\n"

	      notify_slack(message)
      else
      		notify_slack("Package creation failed")
      end
	end

	 def notify_slack(message)
	 		notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
	  		defaults channel: "#staging_log",
	           username: "netlify_hooks"
		end

		notifier.ping message
 	end
end

