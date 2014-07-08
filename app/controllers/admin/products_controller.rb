class Admin::ProductsController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]
	before_action :admin_required, :except => [:index, :show]
	def new 
		@product = Product.new
	end 
	def show 
		@product = Product.find(params[:id])
	end
	def create 
		@product = Product.new(product_params)
		if @product.save
		  redirect_to root_path
		else
			render :new
		end
	end
	def index
		@products = Product.paginate(:page => params[:page], :per_page => 4)
	end
	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to root_path
	end

	private
	def product_params
		params.require(:product).permit(:title, :description, :quantity, :image, :price)
	end
end
