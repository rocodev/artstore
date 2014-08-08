class CardChargesController < ApplicationController
 
  before_action :authenticate_user!
 
  def create
  	@order = current_user.orders.find_by_token(params[:order_id])
  	e = CreditCardPaymentService.new(current_cart, @order, current_user, params).pay! 	
  	if e.present?
  		flash[:error] = e.message
      render "orders/pay_with_credit_card"
    else
    	redirect_to order_path(@order.token), :notice => "成功完成付款"
    end 

  end
 
end