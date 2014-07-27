class CardChargesController < ApplicationController

  before_action :authenticate_user!

  def create

    @order = current_user.orders.find_by_token(params[:order_id])
    @amount = @order.total * 100 # in cents
   
    charge = StripeCharge.create(
      :amount      => @amount,
      :card  => params[:stripeToken],
      :description => @order.token,
    )

    if charge.successful?
      CardChargingService.new(@order).charge_card!
      redirect_to order_path(@order.token), :notice => "成功完成付款"
    else
      flash[:error] = charge.error_message
      render "orders/pay_with_credit_card"
    end

  end

end