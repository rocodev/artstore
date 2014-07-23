class Cart < ActiveRecord::Base

  has_many :cart_items, :dependent => :destroy
  has_many :items,  :through => :cart_items , :source=> :product

  def add_product_to_cart(product,quantity)
    items << product
  end

  def remove_product_from_cart(product)
    items.delete(product)
  end

  def total_price
    items.inject(0){|sum,item| sum+=item.price * item.quantity }
  end

  def clear!
    cart_items.delete_all
  end



end
