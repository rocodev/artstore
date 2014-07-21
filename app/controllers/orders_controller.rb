class OrdersController < ApplicationController

  before_action :authenticate_user!

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      OrderPlacingService.new(current_cart, @order).place_order!

      redirect_to order_path(@order.token)
    else
      render "carts/checkout"
    end
  end

  def show
    @order =  current_user.orders.find_by_token(params[:id])
    @order_info = @order.info
    @order_items = @order.items
  end

  def pay_with_credit_card
    @order =  current_user.orders.find_by_token(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:info_attributes =>
       [:billing_name, :billing_address,:shipping_name, :shipping_address] )
  end

end
