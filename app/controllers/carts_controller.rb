class CartsController < ApplicationController
	before_action :authenticate_user!, :inly => [:checkout]

	def index
		@cart = current_cart.items.all
	end

	def checkout
		@order = current_user.orders.build
		@info = @order.build_info
		#build和model_build兩個是相反過來的
	end
end
