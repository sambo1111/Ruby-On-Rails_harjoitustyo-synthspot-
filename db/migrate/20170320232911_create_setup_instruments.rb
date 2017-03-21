class CreateSetupInstruments < ActiveRecord::Migration
  def change
    create_table :setup_instruments do |t|
      t.integer :instrument_setup_id
      t.integer :instrument_id

      t.timestamps null: false
    end
  end
end
