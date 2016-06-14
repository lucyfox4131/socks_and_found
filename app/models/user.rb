class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  enum role: %w(default admin)

  def self.display_name(current_user)
    if current_user
      name.capitalize
    else
      "to Socks and Found"
    end
  end
end
