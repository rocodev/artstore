class AddColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :created_on, :date
    add_column :products, :updated_on, :date
  end
end
