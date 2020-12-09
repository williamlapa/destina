class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :description
      t.string :address
      t.integer :quantity
      t.string :status
      t.integer :value
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
