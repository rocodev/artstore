class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  has_many :items, :through => :cart_items, :source => :product

  def add_product_to_cart(product,qty)
    cart_item = cart_items.build
    cart_item.product = product
    cart_item.quantity = qty
  end

  def total_price
    items.inject(0) {|sum,item| sum + item.price}
  end

  def clear!
    cart_items.delete_all
  end
end
