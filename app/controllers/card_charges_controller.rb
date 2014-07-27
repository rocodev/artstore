class CardChargesController < ApplicationController
  before_action :authenticate_user!
 
  def create
 
    @order = current_user.orders.find_by_token(params[:order_id])
    @amount = @order.total * 100 # in cents
   
    Stripe.api_key = 'sk_test_4RY8I3PAOpM8Y2CZRsmMCtTC'
 
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
      )
    
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @order.token ,
      :currency    => 'usd'
    )
 
    @order.set_payment_with!("credit_card")
    @order.make_payment! 
 
    redirect_to order_path(@order.token), :notice => "成功完成付款"
 
    rescue Stripe::CardError => e
      flash[:error] = e.message
      render "orders/pay_with_credit_card"
  end  
end
