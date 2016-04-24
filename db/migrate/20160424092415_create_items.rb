class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :pc, index: true, foreign_key: true
      t.references :item_master, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
