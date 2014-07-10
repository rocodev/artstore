class RemoveImageFromProducts < ActiveRecord::Migration
  def self.up
    remove_column :products, :image
  end
end
