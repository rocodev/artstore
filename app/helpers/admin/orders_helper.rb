module Admin::OrdersHelper

  def render_admin_order_link(order)
    link_to(order.token, admin_order_path(order.token))
  end

  def render_order_options_for_admin(order) 
    render :partial => "admin/orders/state_option", :locals => { :order => order}
  end  

  def render_order_state_for_admin(order) 
    render :partial => "admin/orders/state_status", :locals => { :order => order}
  end    
end
