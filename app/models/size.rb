class Size < ActiveRecord::Base
  has_many :socks
  validates :value, presence: true, uniqueness: true
end
