module ProductsHelper

	def render_product_photo(photo, size="thumb")
		if photo.present?

			image_url = photo.image.send(size).url
			#= image_url = photo.image.thumb.url
		else
			case size
				when :medium
					volume = "300x300"
				else
					volume = "200x200"
				end

			image_url = "http://placehold.it/#{volume}&text=No Pic"
		end	

		return image_url
	end

	def render_product_name(product)
		product.title
	end

	def render_product_desc(product)
		simple_format(product.description)
	end

	def render_product_quantity(product)
		product.quantity
	end

	def render_product_price(product)
		product.price
	end

end
