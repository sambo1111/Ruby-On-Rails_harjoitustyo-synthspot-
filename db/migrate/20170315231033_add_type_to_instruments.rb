class AddTypeToInstruments < ActiveRecord::Migration
  def change
    add_column :instruments, :type_id, :integer
  end
end
