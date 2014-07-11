# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Cart < ActiveRecord::Base
  
  has_many :cart_items, :dependent => :destroy
  has_many :items, :through => :cart_items, :source => :product
 
 
  def add_product_to_cart(product)
    items << product
  end
 
end