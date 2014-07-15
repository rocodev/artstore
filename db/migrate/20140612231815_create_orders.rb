class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :total, :default => 0
      t.boolean :paid, :default => false
      t.timestamps
    end
  end
end


