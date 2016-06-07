require "rails_helper"

RSpec.feature "visitor adjusts item quantity" do
  scenario "visitor increases quantity" do
    item = create(:item)
    add_to_cart(item)

    visit "/cart"

    within '#cart-sock' do
      expect(page).to have_content(sock.name)
      expect(page).to have_content("Quantity: 1")
    end
    # may need to be "option[3]" instead of just 3, right now this is written for a drop down menu
    find(:quantity, "3").select_option

    within '#cart-sock' do
      expect(page).to have_content("Quantity: 3")
    end
  end

  scenario "visitor decreases quantity" do
    item = create(:item)
    add_to_cart(item, 3)

    visit "/cart"

    within '#cart-sock' do
      expect(page).to have_content(sock.name)
      expect(page).to have_content("Quantity: 3")
    end
    # may need to be "option[1]" instead of just 1, right now this is written for a drop down menu 
    find(:quantity, "1").select_option

    within '#cart-sock' do
      expect(page).to have_content("Quantity: 1")
    end
  end
end
