class CreatePhoto < ActiveRecord::Migration
  def change
    create_table :photo do |t|
      t.string :product_id
      t.string :image

      t.timestamps
    end
  end
end
