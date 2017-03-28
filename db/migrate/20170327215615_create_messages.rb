class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :topic
      t.text :body
      t.string :receiver_name
      t.integer :receiver_id
      t.integer :sender_id

      t.timestamps null: false
    end
  end
end
