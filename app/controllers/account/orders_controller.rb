class Account::OrdersController < ApplicationController
	def index
		@orders = current_user.orders.order("created_at DESC")
	end

	def update
		binding.pry
		@order = Order.find_by_token(params[:id])

		h = { "paid" =>:make_payment, "shipping"=>:ship, "shipped"=> :deliver , "order_cancelled"=>:cancell_order, :good_returned => :return_good}
		
		binding.pry
		#if @order.send(h[params[:go_to_state])
#
		#else
#
		#end

	end

end
