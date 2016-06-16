require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  scenario "item price multiplies quantity and sock price" do
    ordered_sock = OrderItem.new(sock_id: 1, order_id: 1, quantity: 3, sock_price: 5.99)
    expect(ordered_sock.item_price).to eq(ordered_sock.sock_price * ordered_sock.quantity)
  end
end
