class OrderMailer < ActionMailer::Base
  default from: "staff@artstore.com"
 
  def notify_order_placed(order)
    
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info
 
    mail(:to => @user.email , :subject => " [ArtStore] 感謝您完成本次的下單，以下是您這次購物明細 #{order.token}")
  end

  def notify_credit_card_paid(order)
    
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info
 
    mail(:to => @user.email , :subject => " [ArtStore] 感謝您完成付款，訂單 #{order.token}")
  end
end
