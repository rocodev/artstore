class ProductsController < ApplicationController

	def index
		@products = Product.order("created_at DESC").paginate(:page => params[:page], :per_page=>20)
		#@q = Product.search(params[:q])

		#@q = Product.ransack(params[:q])
		#@products = @q.result(distinct: true)
		
  	#fresh_when last_modified: @products.maximum(:updated_at) , public: true  

	end


	def show

		@product = Product.find(params[:id])
		@photos = @product.photos
		set_page_title @product.title
		set_page_description @product.description.truncate(100)
    set_page_keywords @product.title 
    #set_page_image @product.default_photo.image.url
    #fresh_when(:etag=> @product, last_modified: @product.updated_at, public: true)
	end

	def search
		@q = Product.ransack(params[:q]) 
		@products = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 20 )
  end


end
