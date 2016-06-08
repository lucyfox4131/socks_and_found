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
end
