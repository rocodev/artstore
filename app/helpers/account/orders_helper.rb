module Account::OrdersHelper

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

  def render_order_state(order)
    t("orders.order_state.#{order.aasm_state}")
  end

end
