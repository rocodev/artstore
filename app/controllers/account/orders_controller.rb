class Account::OrdersController < ApplicationController
	
	before_action :find_order, :except=>[:index]

	def index
		@orders = current_user.orders.recent
	end

	def cancel
		@order.cancel_order!
		redirect_to :back
	end

	def return
		@order.return_good!
		redirect_to :back
	end

	private
	def find_order
		@order = Order.find_by_token(params[:id])
	end

end
