class OrderItem < ActiveRecord::Base
  belongs_to :sock
  belongs_to :order

  def item_price
    sock_price * quantity
  end
end
