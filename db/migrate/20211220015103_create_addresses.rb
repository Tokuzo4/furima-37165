class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,    null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :chome_address,  null: false
      t.string :building_name,  null: false
      t.string :telephone_number, null: false
      t.references :order_history, null: false, foreign_key:true
      t.timestamps
    end
  end
end
