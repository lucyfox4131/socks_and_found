class Style < ActiveRecord::Base
  attr_accessible :name, :slug
  has_many :socks

  validates :name, presence: true, uniqueness: true
  validates_presence_of :slug

  def to_param
    slug
  end

end
