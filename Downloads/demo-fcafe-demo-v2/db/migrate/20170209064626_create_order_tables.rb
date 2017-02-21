class CreateOrderTables < ActiveRecord::Migration[5.0]
  def change
    create_table :order_tables do |t|
      t.date :begin_time
      t.date :end_time
      t.references :user, foreign_key: true
      t.references :table, foreign_key: true

      t.timestamps
    end
  end
end
