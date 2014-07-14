class AddPaymentMethodToOrder < ActiveRecord::Migration
  def change
  	add_columns :orders, :payment_method, :string
  end
end
