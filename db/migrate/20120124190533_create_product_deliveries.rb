class CreateProductDeliveries < ActiveRecord::Migration
  def change
    create_table :product_deliveries do |t|
      t.integer :count
      t.integer :product_id

      t.timestamps
    end
  end
end
