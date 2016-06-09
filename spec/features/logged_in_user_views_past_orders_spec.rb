require "rails_helper"

RSpec.feature "Logged in user sees orders" do
  scenario "user visits past orders" do
    user = create(:user)
    order_1 = Order.create(user_id: user.id)
    order_2 = Order.create(user_id: user.id)
    order_3 = Order.create(user_id: user.id)

    login(user)

    visit "/orders"

    expect(page).to have_content("You have 3 orders:")
    within "#one-order" do
      expect(page).to have_content(order_1.id)
      expect(page).to have_content(order_2.id)
      expect(page).to have_content(order_3.id)
    end
  end

  context "user is not logged in" do
    scenario "user is sent to the login path" do
      visit "/orders"
      expect(page).to have_content("You must be logged in to view this page.")
      expect(current_path).to eq(login_path)
    end
  end
end
