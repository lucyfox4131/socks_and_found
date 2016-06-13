class User < ActiveRecord::Base
  has_many :orders

  has_secure_password validations: false
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true, if: "uid.nil?"
  validates :password, presence: true, confirmation: true, if: "uid.nil?"

  enum role: %w(default admin)

  def self.from_omniauth(auth_info)
    user = find_or_create_by(uid: auth_info[:uid]) do |new_user|
      new_user.uid = auth_info.uid
      new_user.name = auth_info.extra.raw_info.name
      new_user.screen_name = auth_info.extra.raw_info.screen_name
      new_user.oauth_token = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
    return user if user.save
  end
end
