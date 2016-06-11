class AddRetiredToSocks < ActiveRecord::Migration
  def change
    add_column :socks, :retired, :boolean, default: false
  end
end
