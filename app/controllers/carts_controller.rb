class CartsController < ApplicationController
  before_action :authenticate_user!, :only => [:checkout]

 def index
 end

 #def destroy
 #end

 def clear_cart
  current_cart.clear!
 
  redirect_to :action => "index"
 end

 def clear_item
  CartItem.find(params[:id]).destroy
  redirect_to :action => "index"
 end  
  
  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end
end
