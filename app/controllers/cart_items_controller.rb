class CartItemsController < ApplicationController
		
	before_action :authenticate_user!

	def update

		@cart_item = current_cart.cart_items.find(params[:id])
		if @cart_item.update(cart_item_params)			
			respond_to do |format|
			  format.html { redirect_to carts_path }
			  format.js 
			end
			#redirect_to carts_path
		else
			redirect_to carts_path
			#render "carts/index"
		end

	end

	def add_to_cart
		@product = Product.find(params[:id])

		if !current_cart.items.include?(@product)
			current_cart.add_product_to_cart(@product)
			flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
    else
      flash[:warning] = "你的購物車內已有此物品"
    end

    redirect_to :back
  end

  def remove_from_cart
  	#@product = Product.find(params[:id])
  	@cart_item = current_cart.cart_items.find(params[:id])
  	@product = @cart_item.product

  	if current_cart.items.include?(@product)
  		current_cart.remove_product_from_cart!(@cart_item)
  		flash[:notice] = "你已成功將 #{@product.title} 移除購物車"
  	else
      flash[:warning] = "你的購物車內沒有此物品"
    end
    redirect_to carts_path
  end


	private 

	def cart_item_params
		params.require(:cart_item).permit(:quantity)
	end

end
