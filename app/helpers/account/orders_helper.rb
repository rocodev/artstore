module Account::OrdersHelper

		def render_order_options_for_user(order)
			link_class = "btn btn-primary btn=lg"
			state = order.aasm_state

			if state == "order_placed" || state == "paid" 
				link_to("取消訂單", cancel_account_order_path(order.token), :class=>link_class, :method => :post)
			elsif state =="shipping" || state == "shipped"
				link_to("退貨", return_account_order_path(order.token), :class=>link_class, :method => :post)
			else
				link_to("Disable" , "#", :class => "btn btn-warnrng btn-lg disabled", :role=>"button")
			end
		end
			

end
