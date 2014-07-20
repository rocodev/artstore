class Account::OrdersController < ApplicationController

  def index
   @order = current_user.orders 
  end


end
