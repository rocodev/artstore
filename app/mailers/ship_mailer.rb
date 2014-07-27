class ShipMailer < ActionMailer::Base
  default from: "staff@artstore.com"

  def notify_order_shipped(order)
    
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info

    mail(:to => @user.email , :subject => " [ArtStore] 您的訂單已出貨 #{order.token}")
  end
end
