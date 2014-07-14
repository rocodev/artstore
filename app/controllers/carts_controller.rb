class CartsController < ApplicationController
	def index
		@cart = current_cart.items.all
	end

end
