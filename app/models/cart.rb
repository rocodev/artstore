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
		items << product
	end

	def remove_product_from_cart!(product)
		items.destroy(product)
	end

	def remove_all_product_from_cart!
		items.clear
	end

	def total_price
		cart_items.inject(0) {|sum , cart_item| sum + (cart_item.product.price * cart_item.quantity)}
		#items.inject(0) {|sum, item| sum + item.price}
	end


end
