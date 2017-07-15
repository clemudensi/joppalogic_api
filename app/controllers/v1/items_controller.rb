class ItemsController < ApplicationController
	def index
		@parcels = Parcel.all
		render :index
	end
end