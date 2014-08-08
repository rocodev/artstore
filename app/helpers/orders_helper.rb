module OrdersHelper

	def render_order_link(order)
		link_to(order.token, order_path(order.token))
	end

	def render_admin_order_link(order)
		link_to(order.token, admin_order_path(order.token))
	end

	def render_order_created_time(order)
		order.created_at.to_s(:short)
	end

	def render_order_user_name(user)
		user.email
	end

	def render_order_total(order)
		order.total
	end

	def render_order_state(order)
		span_class = "label "

		if order.is_failed?
			span_class += "label-danger"
		else
			span_class += "label-info"	
		end
		content_tag(:span , t("orders.order_state.#{order.aasm_state}")  ,:class=>span_class)
		
	end

	def render_order_payment_method(order)
		t("orders.payment_methods.#{order.payment_method}") 		if order.payment_method.present?
	end

	def render_stripe_public_key
		#javascript_tag("Stripe.setPublishableKey('#{Settings.stripe.public_key}'", :type=>'text/javascript');
	end

end
