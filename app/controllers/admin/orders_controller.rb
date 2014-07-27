class Admin::OrdersController < AdminController
	
	before_action :find_order, :except=>[:index]

	def index
		@orders = Order.recent
	end

  def show
    #@order =  Order.find_by_token(params[:id])
    @order_info = @order.info
    @order_items = @order.items
  end


	def update		
		#@order = Order.find_by_token(params[:id])

		h = { "paid" =>:make_payment, "shipping"=>:ship, "shipped"=> :deliver , "order_cancelled"=>:cancel_order, "good_returned" => :return_good}	
		switch_state = h[params[:order][:aasm_state]]
		
		begin
			@order.send(switch_state)
			@order.save
			flash[:notice] =  "訂單狀態更改成功"
			redirect_to admin_orders_path 
		rescue	
			redirect_to admin_orders_path , :alert => "Sorry,訂單狀態的更改不符合程序"
		end

	end

# copy from solution
	
	def ship
		@order.ship!
		redirect_to :back
	end

	def shipped
		@order.deliver!
		redirect_to :back
	end

	def cancel
		@order.cancel_order!
		redirect_to :back
	end

	def return
		@order.return_good!
		redirect_to :back
	end


###########################

	def find_order
		@order = Order.find_by_token(params[:id])
	end

end
