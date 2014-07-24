class Admin::OrdersController < ApplicationController
	def index
		@orders = Order.order("created_at DESC")
	end

  def show
    @order =  Order.find_by_token(params[:id])
    @order_info = @order.info
    @order_items = @order.items
  end


	def update		
		@order = Order.find_by_token(params[:id])


		h = { "paid" =>:make_payment, "shipping"=>:ship, "shipped"=> :deliver , "order_cancelled"=>:cancel_order, "good_returned" => :return_good}	
		switch_state = h[params[:order][:aasm_state]]
		#binding.pry

		begin
			@order.send(switch_state)
			@order.save
			flash[:notice] =  "訂單狀態更改成功"
			redirect_to admin_orders_path 
		rescue
			# Why I couldn't use render?
			#flash[:notice] =  "訂單狀態更改成功"
			render :index
			# redirect_to admin_orders_path , :alert => "Sorry,訂單狀態的更改不符合程序"
		end

	end

end
