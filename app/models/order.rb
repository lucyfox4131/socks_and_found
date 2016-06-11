class Order < ActiveRecord::Base
  belongs_to :user
  has_many :socks, through: :order_items
  has_many :order_items

  def total_price
    order_items.map do |order_item|
      order_item.quantity * order_item.sock_price.to_f
    end.reduce(:+)
  end

  def total_quantity
    order_items.map(&:quantity).reduce(:+)
  end

  def updated
    if status == "completed" || status == "cancelled"
      "This order was updated to the status of #{status} at
      #{updated_at.strftime('%A, %B %d, %Y at %I:%M%p')}."
    end
  end
end
