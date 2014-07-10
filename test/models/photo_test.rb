# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  image      :string(255)
#  product_id :integer
#

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
