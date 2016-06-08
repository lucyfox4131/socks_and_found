require "rails_helper"

RSpec.feature "visitor adjusts sock quantity" do
  scenario "visitor increases quantity" do
    sock = create(:sock)
    add_to_cart(sock)

    visit "/cart"

    within "#cart-socks" do
      expect(page).to have_content(sock.name)
      expect(page).to have_content("Quantity: 1")
    end

    click_button "+"
    click_button "+"

    within "#cart-socks" do
      expect(page).to have_content("Quantity: 3")
    end
  end

  scenario "visitor decreases quantity" do
    sock = create(:sock)
    add_to_cart(sock, 3)

    visit "/cart"

    within "#cart-socks" do
      expect(page).to have_content(sock.name)
      expect(page).to have_content("Quantity: 3")
    end
    click_button "-"
    click_button "-"

    within "#cart-socks" do
      expect(page).to have_content("Quantity: 1")
    end
  end
end
