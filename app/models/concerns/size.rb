class Size < ActiveRecord::Base
  validates :value, presence: true, uniqueness: true

end
