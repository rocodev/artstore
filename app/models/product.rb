class Product < ActiveRecord::Base
	validates :title, :quantity, :price, presence: true
	validates :quantity, :price, numericality: true
	mount_uploader :image, ImageUploader
end
