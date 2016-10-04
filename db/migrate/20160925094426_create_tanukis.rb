class CreateTanukis < ActiveRecord::Migration
  def change
    create_table :tanukis do |t|
      t.string :pic
      t.string :race
      t.string :photoby
      t.text :url

      t.integer :trial, null: false, default: 0
      t.integer :correct, null: false, default: 0

      t.timestamps null: false
    end
  end
end
