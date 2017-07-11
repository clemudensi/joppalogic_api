# class V1::ItemsController < ApplicationController
# 	def index
# 		@items = Item.all

# 		render json: @items, status: :ok
# 	end

# 	def create
# 		@item = Item.new(item_params)

# 		@item.save
# 		render json: @item, status: :created
# 	end

# 	def destroy
# 		@item = Item.where(id: params[:id]).first

# 		if(@item.destroy)
# 			#head is rails way of returning content in the header alone
# 			#since the item will not exist anymore
# 			head(:ok)
# 		else
# 			head(:unprocessable_entity)
# 		end
# 	end

# 	private

# 	def item_params
# 		params.require(:item).permit(:item_number,
#     								:item_description,
#     								:item_amount,
#     								:item_quantity,
#     								:item_weight,
#     								:package_number)
# 	end
# end
