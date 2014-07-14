class AddPriceToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :price, :integer, :default =>0
  end
end
