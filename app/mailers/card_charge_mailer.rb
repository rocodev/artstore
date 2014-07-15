class CardChargeMailer < ActionMailer::Base
  default from: "staff@artstore.com"

  def card_charge_placed(order)
    
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info


    mail(:to => @user.email , :subject => " [ArtStore] 感謝您完成信用卡付款，以下是您這次購物明細 #{order.token}")
  end
end
