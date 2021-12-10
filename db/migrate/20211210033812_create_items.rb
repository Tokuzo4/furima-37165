class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :nickname, null: false
      t.string :last_name, null: false
      t.string :last_name_furigana, null: false
      t.string :first_name, null: false
      t.string :first_name_furigana, null: false
      t.date :birthday, null: false
      t.timestamps
    end
  end
end
