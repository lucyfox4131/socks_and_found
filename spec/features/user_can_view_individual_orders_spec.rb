require "rails_helper"

RSpec.feature "an existing user can view their individual past orders" do
  scenario "they are redirected to order path" do
    user = create(:user)
    order_1 = Order.create(user_id: user.id)
    order_2 = Order.create(user_id: user.id)
    order_3 = Order.create(user_id: user.id)

    login(user)
    visit "/orders"

    click_link "#{order_1.id}"

    expect(current_path).to eq order_path(order_1)
    expect(page).to have_content(order_1.id)
  end

  scenario "they see order item links, prices, statuses, date/time" do
    user = create(:user)
    order_1 = Order.create(user_id: user.id)
    # add order-items to order once order-items are implemented

    visit order_path(order_1)

    # add assertions upon creation of order-item, status, and checkout functionality
    # don't forget to delete user story below
  end
end



# Background: An existing user that has one previous order
#
# As an authenticated user
# When I visit "/orders"
# Then I should see my past order
# And I should see a link to view that order
# And when I click that link
# Then I should see each item that was order with the quantity and line-item subtotals
# And I should see links to each item's show page
# And I should see the current status of the order (ordered, paid, cancelled, completed)
# And I should see the total price for the order
# And I should see the date/time that the order was submitted
#
# If the order was completed or cancelled
# Then I should see a timestamp when the action took place
