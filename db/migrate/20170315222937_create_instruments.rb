class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.integer :year
      t.text :info
      t.integer :manufacturer_id

      t.timestamps null: false
    end
  end
end
