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

class Photo < ActiveRecord::Base
		mount_uploader :image, ImageUploader
		belongs_to :product
end
