require 'rails_helper'

RSpec.feature "visitor browses category" do
  scenario "visitor sees socks in a specific category" do
    sock_1, sock_2, sock_3 = create_list(:sock, 3)
    category = sock_1.category.title

    visit "/#{category}"

    within '.socks' do
      expect(page).to have_content sock_1.name
      expect(page).to have_content sock_1.price
      expect(page).to have_content sock_2.image_url
      expect(page).to have_content sock_3.foot
    end
  end
end
