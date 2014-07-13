class AddIsAdminToUser < ActiveRecord::Migration
  def change
    # add_column(table_name, column_name, type, options)
    add_column :users, :is_admin, :boolean, :default => false
  end
end
