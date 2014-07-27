class AddForSaleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :for_sale, :boolean
  end
end
