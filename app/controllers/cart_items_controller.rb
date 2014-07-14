class CartItemsController < ApplicationController

  def destroy
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])

    @item.destroy

    flash[:warning] = "刪除成功"
    redirect_to :back
  end
end
