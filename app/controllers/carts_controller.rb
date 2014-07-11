class CartsController < ApplicationController
  before_action :authenticate_user!, :only => [:checkout]

 # def index
 #   @products = current_cart.items.all
 #   @cart_items = current_cart.cart_items.all
 #   @cart_infos = @products.zip(@cart_items)
 # end

  #def destroy
  #end

  #def clear_cart
  #  current_cart.items.destroy_all
  #
  #  redirect_to :action => "index"
  #end

  #def clear_item
  #  CartItem.find(params[:id]).destroy
  #  redirect_to :action => "index"
  #end  
  
  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end
end
