class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.text :info

      t.timestamps null: false
    end
  end
end
