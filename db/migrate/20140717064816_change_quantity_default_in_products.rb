class ChangeQuantityDefaultInProducts < ActiveRecord::Migration
  def change
  	change_column :products, :quantity, :integer, :default => 0
  end
end
