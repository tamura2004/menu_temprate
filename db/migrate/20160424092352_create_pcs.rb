class CreatePcs < ActiveRecord::Migration
  def change
    create_table :pcs do |t|
      t.string :name
      t.integer :gp

      t.timestamps null: false
    end
  end
end
