class AddFirsstNameFuriganaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name_furigana, :string
  end
end
