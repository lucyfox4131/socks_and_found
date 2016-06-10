require "rails_helper"

RSpec.feature "User only has access to their own data" do
  context "logged in user tries to see someone else's information" do
    scenario "user sees only their own orders" do
      user1, user2 = create_list(:user, 2)
      login(user1)

      order1 = user1.orders.create
      order2 = user2.orders.create

      visit "/orders"
      expect(page).to_not have_content(user2.name)
      expect(page).to_not have_content(order2.id)
      expect(page).to have_content(user1.name)
      expect(page).to have_content(order1.id)
    end
  end

  context "user cannot see admin information" do
    scenario "user is redirected to their dashboard" do
      user1 = create(:user)
      login(user1)

      visit "/admin/dashboard"
      expect(page).to have_content("The page you were
                                    looking for doesn't exist (404)")
      expect(page).to_not have_content("Admin Dashboard")
    end
  end
end
