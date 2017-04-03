class AddImageLinkToInstruments < ActiveRecord::Migration
  def change
    add_column :instruments, :image_link, :string
  end
end
