class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.string :name
      t.string :description
      t.integer :status, default: 0
      t.string :image
      t.string :deleted_at
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
