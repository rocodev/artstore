class CartsController < ApplicationController

  before_action :authenticate_user!, :only => [:checkout]

  def index
  end

  def checkout

    params['product'].keys.each do |id|
      @item = current_cart.items.find(id.to_i)
      @item.update_attribute(:quantity,params['product'][id])
    end

    @order = current_user.orders.build
    @info = @order.build_info
  end
  


  def deleteCart
    # 可以用 clear,delete_all,destroy_all
    #current_cart.items.destroy_all
    current_cart.clear!
    # cart = Cart.find_by(id: params[:cart_id])
    # if cart.present?
    #   cart.destroy
    # end
    # session[params[:cart_id]] = nil
    redirect_to root_path
  end



end
