class V1::NotificationsController < ApplicationController
	require 'twilio-ruby'
	skip_before_action :current_user
  # rescue_from StandardError do |exception|
  #   trigger_sms_alerts(exception)
  # end

  def trigger_sms_alerts
    @alert_message = "
      [This is a test] ALERT! 
      It appears the server is having issues.  
      Go to: http://newrelic.com for more details."
    @image_url = "http://howtodocs.s3.amazonaws.com/new-relic-monitor.png"

    # @admin_list = YAML.load_file('config/administrators.yml')
    # @admin_list.each do |admin|

    #   begin
    #     phone_number = admin['phone_number']
    #     send_message(phone_number, @alert_message, @image_url)
    #     render :notification_success, status: :ok
    #   rescue
    #     # status: :bad_request
    #     puts "bad request"
    #   end

    # end

    send_message("+233265231422", @alert_message, @image_url)

    # redirect_to '/'
  end

  def index
  end

  def server_error
    raise 'A test exception'
  end

  private

    def send_message(phone_number, alert_message, image_url)

    	account_sid = 'AC202ba29a03c7130f2e3507d16c95c915'
		auth_token = 'be505d5ca44e4a7b4c89ce693867997d'

      @twilio_number = '+18305417041'
      @client = Twilio::REST::Client.new account_sid, auth_token
      # @account = @client.api.account
      # puts @account.fetch
      message = @client.api.account.messages.create(
        :from => @twilio_number,
        :to => phone_number,
        :body => alert_message,
        # US phone numbers can make use of an image as well.
        # :media_url => image_url 
      )
      puts message.to
    end

end