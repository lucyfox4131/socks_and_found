class RemoveImageUrlFromSocks < ActiveRecord::Migration
  def change
    remove_column :socks, :image_url, :string
  end
end
