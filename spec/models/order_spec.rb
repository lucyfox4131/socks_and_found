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

  scenario "total price finds total of all items in order for one type of item" do
    user = create(:user)
    order = Order.create(user_id: user.id, status: "ordered")
    sock = create(:sock)
    order_item = order.order_items.create(sock_id: sock.id, quantity: 3, sock_price: sock.price)
    expect(order.total_price).to eq(order_item.quantity * order_item.sock_price)
  end

  scenario "total price finds total of all items in order for multiple types of items" do
    user = create(:user)
    order = Order.create(user_id: user.id, status: "ordered")
    sock1, sock2 = create_list(:sock, 2)
    order_item_1 = order.order_items.create(sock_id: sock1.id, quantity: 3, sock_price: sock1.price)
    order_item_2 = order.order_items.create(sock_id: sock2.id, quantity: 5, sock_price: sock2.price)
    expect(order.total_price).to eq(order_item_1.quantity * order_item_1.sock_price + order_item_2.quantity * order_item_2.sock_price)
  end

  scenario "total quantity finds sum of all items in order" do
    user = create(:user)
    order = Order.create(user_id: user.id, status: "ordered")
    sock1, sock2 = create_list(:sock, 2)
    order_item_1 = order.order_items.create(sock_id: sock1.id, quantity: 3, sock_price: sock1.price)
    order_item_2 = order.order_items.create(sock_id: sock2.id, quantity: 5, sock_price: sock2.price)
    expect(order.total_quantity).to eq(order_item_1.quantity + order_item_2.quantity)
  end
end
