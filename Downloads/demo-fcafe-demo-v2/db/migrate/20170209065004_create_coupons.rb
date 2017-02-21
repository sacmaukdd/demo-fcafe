class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :name
      t.integer :percen
      t.date :begin_time
      t.date :end_time
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
