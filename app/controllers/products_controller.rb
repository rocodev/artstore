class ProductsController < ApplicationController
  def index
  	if params[:search]
		@product = Product.where('title LIKE ?', "%#{params[:search]}%")
	else
		@product = Product.all
	end
  end

  def show
  	@product = Product.find(params[:id])
  end

end
