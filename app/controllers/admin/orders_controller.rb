class Admin::OrdersController < AdminController
  def index
    @orders = Order.recent
  end
end
