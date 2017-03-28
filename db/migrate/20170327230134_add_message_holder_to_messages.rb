class AddMessageHolderToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :message_holder_id, :integer
  end
end
