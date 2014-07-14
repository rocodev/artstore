class OrdersController < ApplicationController
 
  before_action :authenticate_user!
 
  def create
    @order = current_user.orders.build(order_params)
 
    if @order.save
      @order.build_item_cache_from_cart(current_cart)
      @order.calculate_total!(current_cart)
      redirect_to root_path
    else
      render "carts/checkout" #跨controller去複用template
    end
  end
 
  private
 
  def order_params
    params.require(:order).permit(:info_attributes => [:billing_name, :billing_address,:shipping_name, :shipping_address] )
  end
 
end