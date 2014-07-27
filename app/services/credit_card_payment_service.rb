class CreditCardPaymentService

	def initialize(cart,order,user, params)
		@cart = cart
		@order = order
		@user = user
		@params = params
	end

	def pay!
		if !@cart.cart_items_quantity_is_legal?
 			#redirect_to will not ternminate the action
 			#If you want to terminate the action. You should add return
 			#after the redirect_to
 			redirect_to carts_path, :notice => "Sorry,存貨不足"
 			return
 		end

    @amount = @order.total * 100 # in cents
   
    Stripe.api_key = Settings.stripe.secret_key
 
    customer = Stripe::Customer.create(
      #:email => current_user.email,
      :email => @user.email,
      :card  => @params[:stripeToken]
      )
 
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @order.token ,
      :currency    => 'usd'
    )

    @order.set_payment_with!("credit_card")
    @order.make_payment! 

    #empty cart and liquidate inventories after payment
		#current_cart.empty_cart!
		@cart.empty_cart!
		#send email to tell user payment is successful
		#OrderMailer.notify_after_payment(@order).deliver
    EmailWorker.perform_async(@order.id,'after_paying_with_credit_card')

    #redirect_to order_path(@order.token), :notice => "成功完成付款"
 		return

    rescue Stripe::CardError => e
    	return e
      #flash[:error] = e.message
      #render "orders/pay_with_credit_card"

  end
end