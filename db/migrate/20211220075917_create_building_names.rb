class CreateBuildingNames < ActiveRecord::Migration[6.0]
  def change
    create_table :building_names do |t|

      t.timestamps
    end
  end
end
