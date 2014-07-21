class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :frontEndHeaders

  def index
    @orders = current_user.orders.recent
  end

  def destroy
    @order = current_user.orders.find(params[:id])

    @order.destroy
  end
end
