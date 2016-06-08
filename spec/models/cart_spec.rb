require "rails_helper"

RSpec.describe Cart, type: :model do
  scenario "cart has contents" do
    cart = Cart.new({"1" => 1})
    expect(cart.contents).to eq({"1" => 1})
  end

  scenario "cart adds socks" do
    cart = Cart.new({"1" => 1})
    sock = create(:sock)
    cart.add_sock(sock.id)
    expect(cart.contents).to eq({"1" => 1, sock.id.to_s => 1})
  end

  scenario "cart has a total" do
    cart = Cart.new({"1" => 1, "2" => 2, "3" => 3})
    expect(cart.total).to eq(6)
  end

  scenario "cart returns total for a sock" do
    cart = Cart.new({"1" => 1, "2" => 2, "3" => 3})
    expect(cart.count_of(2)).to eq(2)
  end

  scenario "cart returns total price" do
    sock_1, sock_2, sock_3 = create_list(:sock, 3)
    cart = Cart.new({sock_1.id.to_s => 1, sock_2.id.to_s => 2, sock_3.id.to_s => 5})
    price = (sock_1.price) + (sock_2.price * 2) + (sock_3.price * 5)
    expect(cart.total_price).to eq(price)
  end
end
