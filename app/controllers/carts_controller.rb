class CartsController < ApplicationController

  before_action :authenticate_user!, :only => [:checkout]

  def index
  end

  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end
  
  def deleteCart
    
    cart = Cart.find_by(id: params[:cart_id])
    if cart.present?
      cart.destroy
    end
    session[params[:cart_id]] = nil
    redirect_to root_path
  end

end
