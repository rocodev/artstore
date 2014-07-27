class CardChargingService
  def initialize(user,order,amount,token)
    @user = user
    @order = order
    @amount = amount
    @token = token
  end
 
  def charge!

    Stripe.api_key = Settings.stripe.api_key
 
    customer = Stripe::Customer.create(
      :email => @user.email,
      :card  => @token
      )
    
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @order.token,
      :currency    => 'usd'
    )
 
    @order.set_payment_with!("credit_card")
    @order.make_payment! 

  end
end