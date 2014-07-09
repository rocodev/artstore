class Product < ActiveRecord::Base
  validates :title, :presence => true
  mount_uploader :photo, ProductPhotoUploader
end
