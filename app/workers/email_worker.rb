class EmailWorker
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(order_id , condition)
		@order = Order.find(order_id)
		case condition
			when "after_placing_order"
				OrderMailer.notify_order_placed(@order).deliver
			when "after_paying_with_credit_card"
				OrderMailer.notify_after_payment(@order).deliver
		end
		
	end
end