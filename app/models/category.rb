class Category < ActiveRecord::Base
  has_many :socks

  validates :title, presence: true, uniqueness: true
end
