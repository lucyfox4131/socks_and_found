class Style < ActiveRecord::Base
  has_many :socks

  validates :name, presence: true, uniqueness: true
end
