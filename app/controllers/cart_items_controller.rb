class CartItemsController < ApplicationController

  before_action :authenticate_user!

 # before_action :find_cart

  def update
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])

    @item.update(item_params)
    
    redirect_to carts_path
  end

  def destroy
    @cart = current_cart
    @item = @cart.cart_items.find(params[:id])

    @item.destroy

    flash[:warning] = "Delete Success!"
    redirect_to :back

  end


  private

  def item_params
    params.require(:cart_item).permit(:quantity)
  end

end
