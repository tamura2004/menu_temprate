class CreateMasterRaces < ActiveRecord::Migration
  def change
    create_table :master_races do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
