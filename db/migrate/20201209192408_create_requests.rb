class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :quantity
      t.string :status
      t.string :description
      t.string :legal_framework

      t.timestamps
    end
  end
end
