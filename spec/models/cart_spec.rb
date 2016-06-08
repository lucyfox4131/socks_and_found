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
end
