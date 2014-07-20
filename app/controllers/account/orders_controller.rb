class Account::OrdersController < ApplicationController
	def index
		@orders = current_user.orders.order("created_at DESC")
	end

	def show
	end


end
