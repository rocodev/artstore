class Admin::OrdersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @order = Order.all
  end

end
