class CreateInstrumentSetups < ActiveRecord::Migration
  def change
    create_table :instrument_setups do |t|
      t.string :name
      t.text :info
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
