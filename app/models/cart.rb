class Cart < ActiveRecord::Base
	has_many :cart_items, :dependent => :destroy
	has_many :items, :through => :cart_items, :source => :product

	def add_product_to_cart(product)
		items << product
	end

	def total_price
		sum = 0
		items.each do |i|
			sum = sum + i.price
		end
		sum
		#items.inject(0) {|sum, item| sum + item.price }
	end
end
