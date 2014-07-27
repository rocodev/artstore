class CardChargesMailer < ActionMailer::Base
  default from: "staff@artstore.com"
 
  def notify_card_charged(order)
    
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info
  
    mail(:to => @user.email , :subject => " [ArtStore] 您的訂單已付款成功，以下是您這次購物明細 #{order.token}")
  end
end