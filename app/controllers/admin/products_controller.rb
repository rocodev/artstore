class Admin::ProductsController < ApplicationController
	before_action :authenticate_user!
	before_action :admin_required

	def index
		@product = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		
		if @product.save
			flash.now[:notice] = "Success"
			redirect_to admin_products_path
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			flash.now[:notice] = "Success"
			redirect_to admin_products_path
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admin_products_path
		flash.now[:notice] = "Product deleted"
	end

	private
		def product_params
			params.require(:product).permit(:title, :description, :quantity, :image, :price)
		end
end
