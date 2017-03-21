class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.text :info
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
