class AddTopicToSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :topic, :string
  end
end
