class Sock < ActiveRecord::Base
  belongs_to :style
  belongs_to :category
  belongs_to :size
  has_many :orders, through: :order_items
  has_many :order_items
  validates :name, presence: true, uniqueness: true
  validates :foot, presence: true
  validates :price, presence: true
  validates :style_id, presence: true
  validates :category_id, presence: true
  validates :size_id, presence: true
end
