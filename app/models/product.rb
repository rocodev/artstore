class Product < ActiveRecord::Base
	validates :title, :quantity, :price, presence: true
	validates :quantity, :price, numericality: true

	has_many :images
	accepts_nested_attributes_for :images

	def default_image
		images.first
	end

end
