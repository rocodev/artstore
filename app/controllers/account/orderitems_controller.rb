class Account::OrderitemsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @orders = Order.find(params[:id])
    @order_info = @orders.info
    @items = @orders.items
  end

end
