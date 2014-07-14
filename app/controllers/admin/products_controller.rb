class Admin::ProductsController < ApplicationController
	before_action :authenticate_user!
	before_action :admin_required

	def index
		if params[:search]
			@product = Product.where('title LIKE ?', "%#{params[:search]}%")
		else
			@product = Product.all
		end
	end

	def new
		@product = Product.new
		@image = @product.images.new
	end

	def create
		@product = Product.new(product_params)
		@product.default_image = @product.images.first.image_url.to_s if @product.images.length > 0
		if @product.save
			flash[:notice] = "Success"
			redirect_to admin_products_path
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
		@image = @product.images.all
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			flash[:notice] = "Success"
			redirect_to admin_products_path
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admin_products_path
		flash[:notice] = "商品已刪除"
	end

	def destroy_image
		@image = Image.find(params[:id])
		@product = @image.product
		@image.destroy
		flash[:notice] = "圖片已刪除"
		redirect_to admin_product_path(@product)
	end

	private
		def product_params
			params.require(:product).permit(:title, :description, :quantity, :price, :images_attributes => [:image])
		end
end
