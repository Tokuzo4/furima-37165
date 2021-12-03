class AddLastNameFuriganaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name_furigana, :string
  end
end
