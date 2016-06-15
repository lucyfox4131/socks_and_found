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
      
      expect(page).to have_content("Order was successfully placed")
      expect(current_path).to eq(orders_path)
      expect(page).to have_content(user.orders.first.id)
      visit cart_path
      expect(page).to_not have_content(sock_1.name)
      expect(page).to_not have_content(sock_2.name)
    end
  end
end
