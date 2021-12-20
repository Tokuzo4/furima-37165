class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name,    null: false
      t.integer :price  ,null: false
      t.timestamps
    end
  end
end
