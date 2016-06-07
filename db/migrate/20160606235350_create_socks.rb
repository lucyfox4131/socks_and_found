class CreateSocks < ActiveRecord::Migration
  def change
    create_table :socks do |t|
      t.string :name
      t.string :foot
      t.decimal :price
      t.string :image_url
      t.references :style, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :size, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
