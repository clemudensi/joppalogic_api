class V1::HooksController < ApplicationController
	skip_before_action :current_user

	def get_parcel
	    if request.headers['Content-Type'] == 'application/json'
	      @data = JSON.parse(request.body.read)
	      notify_slack(@data.to_s)
	    else
	      # application/x-www-form-urlencoded
	      @data = params.as_json
	      notify_slack(@data.to_s)
	    end

	    # Webhook::Received.save(data: data, integration: params[:integration_name])

	    # render nothing: true
	    render :get_parcel
	end

	private 

	 def notify_slack(message)
	 		notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
	  		defaults channel: "#staging_log",
	           username: "netlify_hooks"
		end

		notifier.ping message
 	end
end

