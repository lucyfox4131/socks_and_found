class Sock < ActiveRecord::Base
  belongs_to :style
  belongs_to :category
  belongs_to :size

  validates :name, presence: true, uniqueness: true
end
