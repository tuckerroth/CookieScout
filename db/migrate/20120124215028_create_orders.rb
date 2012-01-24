class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :count
      t.string :name
      t.integer :product_id

      t.timestamps
    end
  end
end
