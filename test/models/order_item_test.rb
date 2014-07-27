# == Schema Information
#
# Table name: order_items
#
#  id           :integer          not null, primary key
#  product_name :string(255)
#  price        :float
#  quantity     :integer
#  order_id     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
