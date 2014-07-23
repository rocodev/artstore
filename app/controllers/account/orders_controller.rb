class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
   @order = current_user.orders.recent 
  end

  def show
    #@order = Order.items.where(id: params[:id])
  end    

end
