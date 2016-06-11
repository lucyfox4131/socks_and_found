require "rails_helper"

RSpec.describe Cart, type: :model do
  scenario "cart has contents" do
    cart = Cart.new("1" => 1)
    expect(cart.contents).to eq("1" => 1)
  end

  scenario "cart adds socks" do
    cart = Cart.new("1" => 1)
    sock = create(:sock)
    cart.add_sock(sock.id)
    expect(cart.contents).to eq("1" => 1, sock.id.to_s => 1)
  end

  scenario "cart has a total" do
    cart = Cart.new("1" => 1, "2" => 2, "3" => 3)
    expect(cart.total).to eq(6)
  end

  scenario "cart returns total for a sock" do
    cart = Cart.new("1" => 1, "2" => 2, "3" => 3)
    expect(cart.count_of(2)).to eq(2)
  end

  scenario "cart returns total price" do
    sock_1, sock_2, sock_3 = create_list(:sock, 3)
    cart = Cart.new(sock_1.id.to_s => 1, sock_2.id.to_s => 2, sock_3.id.to_s => 5)
    price = sock_1.price + sock_2.price * 2 + sock_3.price * 5
    expect(cart.total_price).to eq(price)
  end

  scenario "cart removes a sock" do
    sock_1, sock_2, sock_3 = create_list(:sock, 3)
    cart = Cart.new(sock_1.id.to_s => 1, sock_2.id.to_s => 2, sock_3.id.to_s => 5)
    cart.remove_sock(sock_3.id)
    expect(cart.contents).to eq(sock_1.id.to_s => 1, sock_2.id.to_s => 2)
  end

  scenario "can increase sock quantity" do
    sock = create(:sock)
    cart = Cart.new(sock.id.to_s => 1)
    cart.update_quantity(sock.id, "plus")
    expect(cart.contents).to eq(sock.id.to_s => 2)
  end

  scenario "can decrease sock quantity" do
    sock = create(:sock)
    cart = Cart.new(sock.id.to_s => 3)
    cart.update_quantity(sock.id, "minus")
    expect(cart.contents).to eq(sock.id.to_s => 2)
  end

  scenario "removes sock if quantity decreases from 1" do
    sock = create(:sock)
    cart = Cart.new(sock.id.to_s => 1)
    cart.update_quantity(sock.id, "minus")
    expect(cart.contents).to eq({})
  end

  scenario "creates a new order" do
    sock = create(:sock)
    user = create(:user)
    cart = Cart.new(sock.id.to_s => 1)
    expect(Order.all.count).to eq(0)
    cart.create_order(user)
    expect(Order.all.count).to eq(1)
  end
end
