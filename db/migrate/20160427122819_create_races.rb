class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.references :pc, index: true, foreign_key: true
      t.references :master_race, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
