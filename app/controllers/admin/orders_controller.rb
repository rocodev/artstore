class Admin::OrdersController < AdminController

 before_filter :find_order, :except => [:index]

  def index
    @orders = Order.recent
  end

  def show
    
    @order_info = @order.info
    @order_items = @order.items
  end

  def ship
    @order.ship!
    redirect_to :back
  end

  def shipped
    @order.deliver!
    redirect_to :back
  end

  def cancel
    @order.cancell_order!
    redirect_to :back
  end
  
  def return
    @order.return_good!
    redirect_to :back
  end

  protected


  def find_order
    @order =  Order.find_by_token(params[:id])
  end

end
