class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth, default: 0
      t.references :shop, foreign_key: true
      
      t.timestamps
    end
  end
end
