module CartsHelper

  def cart_items_count(cart)
    cart.cart_items.count
  end

  def render_cart_total_price(current_cart)
    current_cart.total_price
  end
end
