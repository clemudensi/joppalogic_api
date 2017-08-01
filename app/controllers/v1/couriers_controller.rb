class V1::CouriersController < ApplicationController
	skip_before_action :current_user
	before_action :set_courier, only: [:show, :update]
	def index
		@couriers = Courier.all
		render :index, status: :ok
	end

	def create
		@courier = Courier.create(courier_params)
		render :create, status: :created
	end

	def show
		render :show
	end

	def update
		if @courier.update(courier_params)
			render :update
		else
			head(:unprocessable_entity)
		end
	end

	private

	def courier_params
		params.require(:courier).permit(:slug, :name, :phone, :web_url, :description, :image_url)
	end

	def set_courier
		@courier = Courier.find(params[:id])
	end
end
