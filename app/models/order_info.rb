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

class OrderInfo < ActiveRecord::Base
  belongs_to :order


  validates :billing_name , :presence => true
  validates :billing_address , :presence => true
  validates :shipping_name , :presence => true
  validates :shipping_address , :presence => true
end
