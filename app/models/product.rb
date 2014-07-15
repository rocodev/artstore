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
#

class Product < ActiveRecord::Base

  has_many :photos
  accepts_nested_attributes_for :photos

  validates :title , :presence => true
  validates :quantity , :presence => true


  def default_photo
    photos.first
  end
end
