class CartItemsController < ApplicationController
		
	before_action :authenticate_user!

	def update

		@cart_item = current_cart.cart_items.find(params[:id])
		if @cart_item.update(cart_item_params)			
			respond_to do |format|
			  format.html { redirect_to carts_path }
			  format.js 
			end
			#redirect_to carts_path
		else
			render "carts/index"
		end

	end


	private 

	def cart_item_params
		params.require(:cart_item).permit(:quantity)
	end

end
