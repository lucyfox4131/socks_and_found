require "rails_helper"

RSpec.feature "User checks out" do
  context "visitor tries to checkout" do
    scenario "visitor must login before checking out" do
      user = create(:user)
      sock_1, sock_2 = create_list(:sock, 2)
      visit sock_path(sock_1)
      click_on "Add to Cart"

      visit sock_path(sock_2)
      click_on "Add to Cart"

      visit cart_path
      expect(page).to have_button("Login or Create Account to Purchase Socks")
      click_on "Login or Create Account to Purchase Socks"
      login(user)

      expect(current_path).to eq(cart_path)
      click_on "Checkout"

      expect(current_path).to eq(new_charge_path)
    end
  end
end
