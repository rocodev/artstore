# == Schema Information
#
# Table name: order_infos
#
#  id               :integer          not null, primary key
#  order_id         :integer
#  billing_name     :string(255)
#  billing_address  :string(255)
#  shipping_name    :string(255)
#  shipping_address :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class OrderInfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
