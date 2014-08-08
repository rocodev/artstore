# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  total          :integer          default(0)
#  paid           :boolean          default(FALSE)
#  created_at     :datetime
#  updated_at     :datetime
#  token          :string(255)
#  payment_method :string(255)
#  aasm_state     :string(255)      default("order_placed")
#

class Order < ActiveRecord::Base

	include Tokenable

	belongs_to :user
	has_many :items, :class_name => "OrderItem", :dependent => :destroy
	has_one :info, :class_name => "OrderInfo", :dependent => :destroy

	accepts_nested_attributes_for :info

	scope :recent, -> { order("created_at DESC")}

	#before_create :generate_token

	def build_item_cache_from_cart(cart)
		cart.cart_items.each do |cart_item|
			item = items.build
			item.product_name = cart_item.product.title
			item.quantity = cart_item.quantity
			item.price = cart_item.product.price
			item.save
		end
	end

	def calculate_total!(current_cart)
		self.total = current_cart.total_price
		self.save
	end

	#def generate_token
	#	self.token = SecureRandom.uuid
	#end

	def set_payment_with!(method)
		self.update_column(:payment_method, method)
	end

	def pay!
		self.update_column(:paid, true)
	end

	def is_pay?
		self.paid
	end

	def is_failed?
		self.aasm_state=="order_cancelled" || self.aasm_state=="good_returned"
	end

	include AASM

	aasm do
		state :order_placed, :initial => true
		
		state :paid, :after_commit => :pay!
		event :make_payment do
			transitions :from => :order_placed, :to => :paid
		end

		state :shipping
		event :ship do
			transitions :from => :paid, :to => :shipping
		end

		state :shipped
		event :deliver do
			transitions :from => :shipping, :to => :shipped
		end

		state :order_cancelled
		event :cancel_order do
			transitions :from => [:order_placed, :paid], :to => :order_cancelled
		end

		state :good_returned
		event :return_good do
			transitions :from => :shipped, :to => :good_returned
		end

	end

end
