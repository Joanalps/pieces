class CreatePieces < ActiveRecord::Migration[7.1]
  def change
    create_table :pieces do |t|
      t.string :name
      t.string :category
      t.string :address
      t.integer :size
      t.string :brand
      t.string :color
      t.string :description
      t.string :tag
      t.string :delivery_mode
      t.integer :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
