module Admin::OrdersHelper
	def render_order_options_for_admin(order)
		link_class = "btn btn-info btn=lg"
		
		html_obj = case order.aasm_state
			when "order_placed"
				link_to("取消訂單", cancel_admin_order_path(order.token), :class=>link_class, :method => :post)
			when "paid"
				link_to("取消訂單", cancel_admin_order_path(order.token), :class=>link_class, :method => :post)+ link_to("出貨", ship_admin_order_path(order.token), :class=>link_class, :method => :post)
			when "shipping"
				link_to("設為到貨", shipped_admin_order_path(order.token), :class=>link_class, :method => :post)
			when "shipped"
				link_to("退貨", return_admin_order_path(order.token), :class=>link_class, :method => :post)
			when "order_cancelled"
				content_tag(:span, "訂單已取消" ,:class=>"label label-danger" )
			when "good_returned"
				content_tag(:span, "已退貨" ,:class=>"label label-danger" )
		end

		html_obj
	end

	def render_admin_order_table_row(order)
		tr_class = ""
		if !order.is_pay?
			tr_class = "info"
		elsif order.is_failed?
			tr_class = "danger"
		else
			tr_class = ""
		end

		tag(:tr , :class=>tr_class)
	end

end
