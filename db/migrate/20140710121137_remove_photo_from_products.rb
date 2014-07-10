class RemovePhotoFromProducts < ActiveRecord::Migration
  def self.up
    remove_column :products, :photo
  end
end
