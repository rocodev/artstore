# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  quantity    :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#  price       :float            default(0.0)
#  created_on  :date
#  updated_on  :date
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
