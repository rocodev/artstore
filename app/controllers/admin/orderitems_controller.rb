class Admin::OrderitemsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def show
    @orders = Order.find(params[:id])
    @order_info = @orders.info
    @items = @orders.items
  end


end
