require "rails_helper"

RSpec.feature "items can be retired" do
  scenario "user can't add retired item to cart" do
    sock = create(:sock)
    sock.update_attributes(retired: true)
    visit sock_path(sock)
    expect(page).to_not have_button("Add to Cart")
    expect(page).to have_content("Item Retired")
  end
end
