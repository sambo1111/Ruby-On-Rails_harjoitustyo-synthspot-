class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :topic
      t.text :body
      t.integer :score
      t.integer :user_id
      t.integer :instrument_id

      t.timestamps null: false
    end
  end
end
