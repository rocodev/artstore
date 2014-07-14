module CartsHelper
	def render_cart_total_price(current_cart)
		current_cart.total_price
	end

	def render_product_image(image)
		image_tag(image.image_url(:thumb).to_s)
	end
end
