# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  product_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class CartItem < ActiveRecord::Base
  
  belongs_to :cart
  belongs_to :product


end
