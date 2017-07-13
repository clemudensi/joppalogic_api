class V1::ParcelsController < ApplicationController
	def index
		@parcels = Parcel.all
		render :index
	end

	def create
		@parcel = Parcel.new()
		@parcel.dimension_width = params[:parcel]['dimension_width']
		@parcel.dimension_height = params[:parcel]['dimension_height']
		@parcel.dimension_depth = params[:parcel]['dimension_depth']
		@parcel.dimension_unit = params[:parcel]['dimension_unit']
		@parcel.parcel_description = params[:parcel]['parcel_description']
		@parcel.weight_value = params[:parcel]['weight_value']
		@parcel.parcel_number = params[:parcel]['parcel_number']
		#gets this from the currently signed in user
		@parcel.user_id = params[:parcel]['user_id']
		
		if @parcel.save
			params[:parcel][:items].each do |item_param|
				item = Item.new
				 item.description = item_param[:description]
				 item.quantity = item_param[:quantity]
				 item.price = item_param[:price]
				 item.currency = item_param[:currency]
				 item.weight = item_param[:weight]
				 item.unit =item_param[:unit]
				 item.parcel_number = item_param[:parcel_number]
				 item.item_number = item_param[:item_number]
				 item.parcel_id = @parcel.id

				 head(:unprocessable_entity) unless item.save
			end
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

	private

	# def parcel_params

	# 	# params[:parcel][:items] ||= []
	# 	params.require(:parcel).permit(
	# 		:box_type, 
	# 		:dimension_width, 
	# 		:dimension_height,
	# 		:dimension_depth, 
	# 		:dimension_unit, 
	# 		:parcel_description, 
	# 		:weight_value, 
	# 		:parcel_number, 
	# 		:user_id,
	# 		items_attributes: [
	# 			:description, 
	# 			:quantity, 
	# 			:price, 
	# 			:currency, 
	# 			:weight, 
	# 			:unit, 
	# 			:parcel_number, 
	# 			:parcel_id, 
	# 			:item_number
	# 		]
	# 	)
	# end
end