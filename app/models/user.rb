class User < ActiveRecord::Base
  has_many :orders

  has_secure_password validations: false
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true, if: "uid.nil?"
  validates :password, presence: true, confirmation: true, if: "uid.nil?"

  enum role: %w(default admin)

  def self.display_name(current_user)
    if current_user
      name.capitalize
    else
      "to Socks and Found"
    end
  end

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

  def tweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.config.twitter_key
      config.consumer_secret     = Rails.application.config.twitter_secret
      config.access_token        = oauth_token
      config.access_token_secret = oauth_token_secret
    end
    client.update(tweet)
  end
end
