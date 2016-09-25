class CreateTanukis < ActiveRecord::Migration
  def change
    create_table :tanukis do |t|
      t.string :pic
      t.string :race
      t.string :photoby

      t.timestamps null: false
    end
  end
end
