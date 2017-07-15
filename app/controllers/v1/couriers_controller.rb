class V1::CouriersController < ApplicationController
	def index
		@couriers = Courier.all
		render :index, status: :ok
	end

	def create
		@courier = Courier.create(courier_params)
		render :create, status: :created
	end

	def show

	end

	private

	def courier_params
		params.require(:courier).permit(:slug, :name, :phone, :web_url, :description)
	end

	def set_courier
		
	end
end
