require "rails_helper"

RSpec.feature "Visit adds an item to cart" do
  context "visitor views a sock" do
    scenario "visitor adds that item to the cart" do
      sock = create(:sock)

      visit sock_path(sock)

      click_on "Add to Cart"

      click_on "View Cart"

      expect(current_path).to eq("/cart")

      within '#cart-socks' do
        expect(page).to have_css("img[src=\"#{sock.image_url.url(:thumb)}\"]")
        expect(page).to have_content(sock.name)
        expect(page).to have_content(sock.price)
        expect(page).to have_content(sock.foot)
        expect(page).to have_content(sock.category.title)
        expect(page).to have_content(sock.size.value)
        expect(page).to have_content(sock.style.name)
        expect(page).to have_content("Quantity: 1")
      end

      within '#total-cart-price' do
        expect(page).to have_content("Cart Total: $#{sock.price}")
      end
    end
  end
end
