class CartsController < ApplicationController

	before_action :authenticate_user!, :only=>[:checkout]
	def index
	end

	def checkout
		@order = current_user.orders.build
		@info = @order.build_info
	end

	def remove_all
		current_cart.remove_all_product_from_cart!
		#render :index
		redirect_to carts_path
	end
end
