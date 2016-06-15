require "rails_helper"

RSpec.feature "visitor creates account to checkout" do
  context "valid information given" do
    scenario "visitor creates account" do
      sock_1, sock_2, sock_3 = create_list(:sock, 3)
      add_to_cart(sock_1)
      add_to_cart(sock_2)
      add_to_cart(sock_3)

      visit "/cart"
      expect(page).to_not have_button "Proceed to Checkout"
      expect(page).to have_button "Login or Create Account to Purchase Socks"
      click_on "Login or Create Account to Purchase Socks"
      
      click_button "Create Account"
      fill_in "Name", with: "Charlie"
      fill_in "Username", with: "c123"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create Account"

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
