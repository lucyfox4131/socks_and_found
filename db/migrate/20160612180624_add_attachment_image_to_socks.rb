class AddAttachmentImageToSocks < ActiveRecord::Migration
  def self.up
    change_table :socks do |t|
      t.attachment :image_url
    end
  end

  def self.down
    remove_attachment :socks, :image_url
  end
end
