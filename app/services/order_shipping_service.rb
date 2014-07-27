class OrderShippingService
  def initialize(order)
    @order = order
  end
 
  def ship_order!
    # Reserve for interactions with logistics

    @order.ship!
    ShipMailer.notify_order_shipped(@order).deliver
  end
end
