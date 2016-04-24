class CreateItemMasters < ActiveRecord::Migration
  def change
    create_table :item_masters do |t|
      t.string :name
      t.integer :gp

      t.timestamps null: false
    end
  end
end
