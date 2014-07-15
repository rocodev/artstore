class ChangeQuantityDefault < ActiveRecord::Migration
  def change
    change_column :products, :quantity, :integer, :default => 0 
    add_column :products, :price, :float,  :default => 0
  end
end
