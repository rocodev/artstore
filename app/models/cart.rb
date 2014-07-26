# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Cart < ActiveRecord::Base

	has_many :cart_items, :dependent => :destroy
	has_many :items, :through => :cart_items, :source => :product

	def add_product_to_cart(product)
		#items << product
		cart_item = self.cart_items.build
		cart_item.product = product
		cart_item.quantity = 1
		cart_item.save
	end

	def remove_product_from_cart!(cart_item)
		#items.destroy(product)
		self.cart_items.destroy(cart_item)
	end

	def remove_all_product_from_cart!
		#items.clear
		self.cart_items.clear
	end

	def total_price
		cart_items.inject(0) {|sum , cart_item| sum + (cart_item.product.price * cart_item.quantity)}
		#items.inject(0) {|sum, item| sum + item.price}
	end

	def empty_cart!
		self.cart_items.each do |cart_item|
			@product = cart_item.product
			@product.liquidate_inventory!(cart_item.quantity)
		end
		self.destroy
	end

	def cart_items_quantity_is_legal?
		self.cart_items.each do |cart_item|
			@product = cart_item.product
			if !@product.product_enough?(cart_item.quantity)
				return false
			end
		end
		return true
	end

end
