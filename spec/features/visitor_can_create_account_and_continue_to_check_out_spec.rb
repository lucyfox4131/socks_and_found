require "rails_helper"

RSpec.feature "visitor creates account to checkout" do
  context "valid information given" do
    scenario "visitor creates account" do
      sock_1, sock_2, sock_3 = create_list(:sock, 3)
      add_to_cart(sock_1)
      add_to_cart(sock_2)
      add_to_cart(sock_3)

      visit "/cart"
      expect(page).to_not have_content "Checkout"
      expect(page).to have_content "Login or Create Account to Checkout"
      click_on "Login or Create Account to Checkout"

      visit "/cart"
      expect(page).to have_content(sock_1.name)
      expect(page).to have_content(sock_2.name)
      expect(page).to have_content(sock_3.name)

      click_on "Logout"

      expect(page).to have_content("Login")
      expect(page).to_not have_content("Logout")
    end
  end
end
