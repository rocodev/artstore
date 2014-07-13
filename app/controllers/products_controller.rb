class ProductsController < ApplicationController
  def index
  	if params[:search]
		@product = Product.where('title LIKE ? OR description LIKE ? OR price LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
	else
		@product = Product.all
	end
  end

  def show
  	@product = Product.find(params[:id])
  end

end
