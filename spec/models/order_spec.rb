require 'rails_helper'

RSpec.describe Order, type: :model do
  scenario "creates order items from cart contents" do
    sock1, sock2, sock3 = create_list(:sock, 3)
    cart_contents = { sock1.id => 1, sock2.id => 2, sock3.id => 3 }
    order = Order.new(user_id: 1, status: "ordered")
    expect(OrderItem.all.count).to eq(0)
    order.create_order_items(cart_contents)
    expect(OrderItem.all.count).to eq(3)
  end
end
