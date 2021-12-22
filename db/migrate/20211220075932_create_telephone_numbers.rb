class CreateTelephoneNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :telephone_numbers do |t|

      t.timestamps
    end
  end
end
