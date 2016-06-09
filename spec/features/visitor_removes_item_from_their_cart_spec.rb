require "rails_helper"

RSpec.feature "visitor removes sock from cart" do
  context "socks are in a visitors cart" do
    scenario "visitor can successfully remove socks from the cart" do
      sock = create(:sock)
      add_to_cart(sock)

      visit "/cart"

      expect(page).to have_content("Cart Total: $#{sock.price}")

      click_button "Remove"

      expect(current_path).to eq("/cart")
      expect(page).to have_css("#flash_success")
      expect(page).to have_content("Successfully removed #{sock.name.pluralize(2)} from your cart.")
      expect(page).to have_link("#{sock.name}")

      expect(page).to_not have_content("Cart Total: $0")
    end
  end
end
