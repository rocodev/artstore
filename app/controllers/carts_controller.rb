class CartsController < ApplicationController
  before_action :frontEndHeaders
  before_action :authenticate_user!, :only => [:checkout]
  def index
    @cart_items = current_cart.cart_items.all
  end
  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end
end