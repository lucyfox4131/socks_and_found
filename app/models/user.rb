class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
