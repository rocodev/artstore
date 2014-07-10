class Product < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	validates :title, presence: true,  uniqueness: true
	validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0}
	validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0}
end
