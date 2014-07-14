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

  def add_to_cart
  	@product = Product.find(params[:id])
  	if !current_cart.items.include?(@product)
  		current_cart.add_product_to_cart(@product)
  		flash[:notice] = "成功將 #{@product.title} 加入購物車"
  	else
  		flash[:warning] = "購物車內已經有此商品"
  	end
  	redirect_to product_path(@product)
  end

end
