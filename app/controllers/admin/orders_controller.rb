class Admin::OrdersController < ApplicationController
  before_action :backEndHeaders
  before_filter :find_order, :except => [:index]

  def index
    @orders = Order.recent
  end

  def show
    @order_info = @order.info
    @order_items = @order.items
  end

  protected


  def find_order
    @order =  Order.find_by_token(params[:id])
  end
end
