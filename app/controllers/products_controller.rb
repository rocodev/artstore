class ProductsController < ApplicationController
  

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if !current_cart.items.include?(@product)
      if @product.quantity > 0
        current_cart.add_product_to_cart(@product)
        flash[:notice] = "你己經成功將 #{@product.title} 加入購物車"
      else
        flash[:warning] = "此物品已停止銷售，你無法將它加入購物車"
      end
    else
      flash[:warning] = "你的購物車己存在此商品"
    end
    redirect_to :back
  end

  def remove_from_cart
    @product = Product.find(params[:id])
    current_cart.remove_product_from_cart(@product)
    redirect_to root_path
  end


end
