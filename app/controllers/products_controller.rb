class ProductsController < ApplicationController

	def index
		#@products = Product.order("created_at DESC").paginate(:page => params[:page], :per_page=>20)
		#@q = Product.search(params[:q])
		@q = Product.ransack(params[:q])
		#@products = @q.result(distinct: true)  
		@products = @q.result(distinct: true)  
		#binding.pry
	end


	def show
		@product = Product.find(params[:id])
		@photos = @product.photos
	end


end
