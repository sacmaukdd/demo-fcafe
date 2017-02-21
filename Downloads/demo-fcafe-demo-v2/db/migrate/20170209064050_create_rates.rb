class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.integer :num_rate
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
