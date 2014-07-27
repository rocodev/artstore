class CardChargingService
  def initialize(order)
    @order = order
  end
 
  def charge_card!
    @order.set_payment_with!("credit_card")
    @order.make_payment!
    CardChargesMailer.notify_card_charged(@order).deliver
  end
end
