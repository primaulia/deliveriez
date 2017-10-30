class CreateDeliveryOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_orders do |t|
      t.string :order_id
      t.datetime :serving_datetime

      t.timestamps
    end
  end
end
