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
	has_many :photos, :dependent => :delete_all
	accepts_nested_attributes_for :photos, :reject_if => :all_blank, allow_destroy: true

	validates :title, :presence => true
	validates :quantity, :presence => true

	def default_photo
		photos.first
	end

	def photos_are_empty?
		photos.empty?
	end
end
