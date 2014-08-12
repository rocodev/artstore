class ProductsController < ApplicationController

	def index
		@products = Product.order("created_at DESC").paginate(:page => params[:page], :per_page=>20)
		#@q = Product.search(params[:q])

		#@q = Product.ransack(params[:q])
		#@products = @q.result(distinct: true)  

	end


	def show
		@product = Product.find(params[:id])
		@photos = @product.photos
	end

	def search
		@q = Product.ransack(params[:q]) 
		@products = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 20 )
  end


end
