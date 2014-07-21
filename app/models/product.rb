class Product < ActiveRecord::Base
  has_many :photos
  accepts_nested_attributes_for :photos

  def getPhoto
    self.photos.first.image_url(:original).to_s
  end

  def getThumb
    self.photos.first.image_url(:thumb).to_s
  end

  def default_photo
    photos.first
  end

end
