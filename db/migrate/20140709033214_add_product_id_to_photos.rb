class AddProductIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :product_id, :integer
  end
end
