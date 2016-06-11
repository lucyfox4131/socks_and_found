require "rails_helper"

RSpec.feature "an existing user can view their individual past orders" do
  scenario "they are redirected to order path" do
    user = create(:user)
    order_1 = Order.create(user_id: user.id)
    login(user)
    visit "/orders"

    click_link order_1.id.to_s

    expect(current_path).to eq order_path(order_1)
    expect(page).to have_content(order_1.id)
  end

  scenario "they see order item links, prices, statuses, date/time" do
    user = create(:user)
    login(user)
    order_1 = Order.create(user_id: user.id, status: "ordered")
    sock_1, sock_2 = create_list(:sock, 2)
    order_item_1 = order_1.order_items.create(sock_id: sock_1.id,
                                              quantity: 2,
                                              sock_price: sock_1.price)
    order_item_2 = order_1.order_items.create(sock_id: sock_2.id,
                                              quantity: 5,
                                              sock_price: sock_2.price)
    total_price = 2 * order_item_1.sock_price + 5 * order_item_2.sock_price
    total_quantity = order_item_1.quantity + order_item_2.quantity
    visit order_path(order_1)
    within "#order_item" do
      expect(page).to have_content(
                    "$#{order_item_1.quantity * order_item_1.sock_price}")
      expect(page).to have_content(
                    "$#{order_item_2.quantity * order_item_2.sock_price}")
      expect(page).to have_link(sock_1.name)
    end

    within "#order_details" do
      expect(page).to have_content("ordered")
      expect(page).to have_content(total_price)
      expect(page).to have_content(
                      order_1.created_at.strftime("%A, %B %d, %Y at %I:%M%p"))
      expect(page).to have_content(total_quantity)
      expect(page).to_not have_content("Updated")
    end

    order_1.update_attributes(status: "completed")
    visit order_path(order_1)
    within "#order_details" do
      expect(page).to have_content("completed")
      expect(page).to have_content(
                    order_1.updated_at.strftime("%A, %B %d, %Y at %I:%M%p"))
    end
  end
end
