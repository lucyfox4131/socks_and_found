class Category < ActiveRecord::Base
  has_many :socks
  before_validation :create_slug
  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  def to_param
    "#{self.slug}"
  end

  def create_slug
    self.slug = title.parameterize if !title.nil?
  end

end
