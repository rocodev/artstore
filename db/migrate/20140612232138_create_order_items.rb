class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.string :product_name
      t.float :price
      t.integer :quantity
      t.integer :order_id
      t.timestamps
    end
  end
end
