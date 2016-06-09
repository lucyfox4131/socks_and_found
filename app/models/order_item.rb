class OrderItem < ActiveRecord::Base
  belongs_to :sock
  belongs_to :order
end
