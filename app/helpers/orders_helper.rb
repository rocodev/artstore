module OrdersHelper

  def render_order_link(order)
    link_to(order.token, order_path(order.token))
  end

  def render_order_created_time(order)
    order.created_at.to_s(:short)
  end
end
