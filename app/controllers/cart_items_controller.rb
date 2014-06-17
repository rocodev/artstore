class CartItemsController < ApplicationController

  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])

    @item.destroy

    flash[:warning] = "Delete Success!"
    redirect_to :back

  end
end
