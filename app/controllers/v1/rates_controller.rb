class V1::RatesController < ApplicationController
	before_action :set_rate, only: [:update,:show]
	skip_before_action :current_user

	def index
		@rates = Rate.all
	end

	def create
		@rate = Rate.new(rate_params)
		if @rate.save
			render :create, status: :created
		else
			head(:unprocessable_entity)
		end
	end

	def show
	end

	def update
		if @user.update(rate_params)
			render :update
		else
			head(:unprocessable_entity)
		end
	end

	def destroy
	end

	private

	def rate_params
		params.require(:rate).permit(:from_location, :to_location, :price, :courier_id)
	end

	def set_rate
		@rate = Rate.friendly.find(params[:id])
	end
end