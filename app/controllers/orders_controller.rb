class OrdersController < ApplicationController

	before_action :authenticate_user!

	def create
		@order = current_user.orders.build(order_params)
		#@order.save will validate the order_info's column
		if @order.save
			@order.build_item_cache_from_cart(current_cart)
			@order.calculate_total!(current_cart)
			redirect_to order_path(@order.token)
		else
			#cross controller
			render "carts/checkout"
		end
	end

	def show
		@order = current_user.orders.find_by_token(params[:id])
		@order_info = @order.info
		@order_items = @order.items
	end

	def pay_with_credit_card
		@order = current_user.orders.find_by_token(params[:id])
		
		if current_cart.cart_items_quantity_is_legal?
			@order.set_payment_with!("credit_card")
			@order.make_payment!

			#empty cart and liquidate inventories after payment
			current_cart.empty_cart!
			redirect_to account_orders_path, :notice => "成功完成付款"
		else
			redirect_to carts_path, :notice => "Sorry,存貨不足"
		end
	end

	private 
		def order_params
			params.require(:order).permit(:info_attributes => [:billing_name, :billing_address, :shipping_name, :shipping_address] )
		end

end
